//
//  Bird.m
//  AnryBird
//
//  Created by rayln on 13-10-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//
#define INIT_POSITION ccp(11,130)
#define MASS 100.0f
#define COLLISION_TYPE 1
#import "Bird.h"

@implementation Bird

- (id)init{
    if (self = [super init]) {
        body_ = cpBodyNew(MASS, cpMomentForCircle(MASS, 12.0f, 12.0f, CGPointZero));
        [self setZOrder:1];
    }
    return self;
}

- (void)initElements:(cpSpace *)space{
    space_ = space;
    cpBody *staticBody = cpSpaceGetStaticBody(space_);
    cpBodySetPos(body_, INIT_POSITION);
    cpSpaceAddBody(space_, body_);
    
    shape_ = cpCircleShapeNew(body_, 12.0f, CGPointZero);
	cpShapeSetElasticity( shape_, 0.5f );
	cpShapeSetFriction( shape_, 0.5f );
    cpShapeSetCollisionType(shape_, COLLISION_TYPE);
    cpShapeSetLayers(shape_, 4);
    
	cpSpaceAddShape(space_, shape_);
    //cpBodySleep(body_);
}
- (void)active{
    //cpSpaceAddBody(space_, body_);
    cpBodyActivate(body_);
}
- (void)animation{
//    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
//    
//    ani.duration = 1;
//    ani.repeatCount = 0;
//    ani.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
//    //ani.toValue = [NSNumber numberWithFloat:200.0f];
//    [self animationDidStart:ani];
    //cpBodyActivate(body_);
//    cpBodySetPos(body_, cpv(200, 200));
    //body_->velocity_func = updateTemp;
    
    cpBodyActivate(body_);
    CCMoveTo *mov = [CCMoveTo actionWithDuration:1 position:ccp(200, 200)];
    [self runAction:mov];
    
}
- (void)setPos:(cpVect)point{
    cpBodySetPos(body_, point);
    //cpBodySleep(body_);
}
- (void)draw{
    [super draw];
}
@end
