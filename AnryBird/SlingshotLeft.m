//
//  SlingshotLeft.m
//  AnryBird
//
//  Created by Rayln Guan on 10/15/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
#define INIT_POSITION ccp(105,121)
#define MASS 1000.0f
#define WIDTH 22
#define HEIGHT 63
#define COLLISION_TYPE 2
#import "SlingshotLeft.h"


@implementation SlingshotLeft

- (id)init{
    if (self = [super init]) {
        [self setZOrder:2];
        body_ = cpBodyNew(MASS, cpMomentForBox(MASS, WIDTH, HEIGHT));
    }
    return self;
}
- (void)initElements:(cpSpace *)space{
    space_ = space;
    cpBody *staticBody = cpSpaceGetStaticBody(space_);
    cpBodySetPos(body_, INIT_POSITION);
    
    cpSpaceAddBody(space_, body_);
    
    shape_ = cpBoxShapeNew(staticBody, WIDTH, HEIGHT);
	cpShapeSetElasticity( shape_, 0.0f );
	cpShapeSetFriction( shape_, 0.0f );
    cpShapeSetCollisionType(shape_, COLLISION_TYPE);
    cpShapeSetLayers(shape_, 3);

	   
    //cpBodySleep(body_);
    cpSpaceAddConstraint(space_, cpPivotJointNew(staticBody, body_, cpBodyGetPos(body_)));
    cpSpaceAddShape(space_, shape_);

}
@end
