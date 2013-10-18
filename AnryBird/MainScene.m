//
//  MainScene.m
//  AnryBird
//
//  Created by rayln on 13-10-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"

#define WALL_X 0
#define WALL_Y 45
#define GRAVITY cpv(0, -100)
enum COLLISION_TYPE{
    COLLISION_BIRD=1,
    COLLISION_SLING=2
};

@implementation MainScene

- (id)init{
    if (self = [super init]) {
        
        _winSize = [[CCDirector sharedDirector] winSize];
        

        [self initElements];
        [self scheduleUpdate];
    }
    return self;
}
- (void)initElements{
    space_ = cpSpaceNew();
    cpSpaceSetGravity( space_, GRAVITY );
    cpSpaceSetIterations(space_, 30);
	cpSpaceSetDamping(space_, 0.8);
	// bottom
	walls_[0] = cpSegmentShapeNew( space_->staticBody, cpv(WALL_X,WALL_Y), cpv(_winSize.width,WALL_Y), 0.0f);
	// top
	walls_[1] = cpSegmentShapeNew( space_->staticBody, cpv(WALL_X,_winSize.height), cpv(_winSize.width,_winSize.height), 0.0f);
	// left
	walls_[2] = cpSegmentShapeNew( space_->staticBody, cpv(WALL_X,WALL_Y), cpv(WALL_X,_winSize.height), 0.0f);
	// right
	walls_[3] = cpSegmentShapeNew( space_->staticBody, cpv(_winSize.width,WALL_Y), cpv(_winSize.width,_winSize.height), 0.0f);
	
	for( int i=0;i<4;i++) {
		cpShapeSetElasticity( walls_[i], 1.0f );
		cpShapeSetFriction( walls_[i], 1.0f );
		cpSpaceAddStaticShape(space_, walls_[i] );
	}
    //cpBody *tem = cpBodyNew(1.0, 1.0);
    move = cpSegmentShapeNew( space_->staticBody, cpv(105,120), cpv(120,120), 0.0f);
    cpShapeSetFriction(move, 100);
    cpSpaceAddStaticShape(space_, move);
    
}

-(void) update:(ccTime) delta
{
	// Should use a fixed size step based on the animation interval.
	int steps = 2;
	CGFloat dt = [[CCDirector sharedDirector] animationInterval]/(CGFloat)steps;

	for(int i=0; i<steps; i++){
		cpSpaceStep(space_, dt);
        
	}
}

- (void)didLoadFromCCB{
    [_bird initElements:space_];
    [_slingshotRight initElements:space_];
    [_slingshotLeft initElements:space_];
    [self initConstraint];
    
    cpSpaceAddCollisionHandler(space_, 1, 2, beginBulletToEnemy, NULL, NULL, NULL, NULL);
}

- (void)initConstraint{
    ccDrawColor4B(46, 24, 8, 255);
    
    glLineWidth(15);
    cpBody *staticBody = cpSpaceGetStaticBody(space_);
    //cpConstraint *dollyServo = cpSpaceAddConstraint(space_, cpPivotJointNew(staticBody, _slingshotRight.getBody, cpBodyGetPos(_bird.getBody)));
    cpConstraint *dollyServo = cpSpaceAddConstraint(space_, cpSlideJointNew(_slingshotLeft.getBody, _bird.getBody, cpvzero, cpvzero, 0, 100));
    
    //cpConstraint *dollyServo = cpSpaceAddConstraint(space_, cpGrooveJointNew(_slingshotLeft.getBody, _bird.getBody, cpv(200, 200), cpv(400, 200), cpvzero));
    cpConstraintSetPostSolveFunc(dollyServo, constraintPost);
}

int beginBulletToEnemy(cpArbiter *arb, cpSpace *space, void *unused){
    NSLog(@"=============beginBulletToEnemy================");
    //CP_ARBITER_GET_SHAPES取出是哪两个shape发生了碰撞，a，b是emery还是bullet，与之前设置回调函数时的第2，3参数的顺序有关
	CP_ARBITER_GET_SHAPES(arb, a, b);
    //我们不能直接在begin函数里面释放刚体或者shape，要等chipmunk做完必要的计算后才能释放。cpSpaceAddPostStepCallback用来安全的完成这个步骤
	cpSpaceAddPostStepCallback(space, (cpPostStepFunc)beginBulletToBomb, a, NULL);
	// The object is dead, don't process the collision further
    //返回1是物体撞击事件有效
    //返回0是物体撞击事件无效
	return 0;
}
int beginBulletToBomb(cpArbiter *arb, cpSpace *space, void *unused){
	return 0;
}
void constraintPost(){
    
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //[_bird active];
    //cpBodySetVel([_bird getBody], ccp(100, 100));
    //[_bird animation];
    UITouch *t = [touches anyObject];
    CGPoint pt = [self convertTouchToNodeSpace:t];
    NSLog(@"%f,%f", pt.x, pt.y);
    
    //self.bird.shape
    
    [_bird setPos:cpv(pt.x, pt.y)];
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint pt = [self convertTouchToNodeSpace:t];
    NSLog(@"%f,%f", pt.x, pt.y);
    
    //self.bird.shape
    cpBodySetAngle(_bird.getBody, 0);
    [_bird setPos:cpv(pt.x, pt.y)];
}

- (void)dealloc{
    [_bird release];
    [_slingshotLeft release];
    [_slingshotRight release];
    [super dealloc];
}

@end
