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
    move = cpSegmentShapeNew( space_->staticBody, cpv(45,100), cpv(55,100), 0.0f);
    //cpSpaceAddStaticShape(space_, move);
    cpSpaceAddShape(space_, move);
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
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //cpBodySetVel([_bird getBody], ccp(100, 100));
    cpBodySetPos(space_->staticBody, ccp(100, 100));
}
- (void)draw{
    
    [super draw];
}

- (void)dealloc{
    [_bird release];
    [_slingshotLeft release];
    [_slingshotRight release];
    [super dealloc];
}

@end
