//
//  SlingshotRight.m
//  AnryBird
//
//  Created by Rayln Guan on 10/15/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
#define INIT_POSITION ccp(118,97)
#define MASS 100.0f
#define WIDTH 20
#define HEIGHT 50
#define COLLISION_TYPE 2
#import "SlingshotRight.h"


@implementation SlingshotRight

- (id)init{
    if (self = [super init]) {
        [self setZOrder:0];
        body_ = cpBodyNew(MASS, cpMomentForBox(MASS, WIDTH, HEIGHT));
    }
    return self;
}

- (void)draw{
    [super draw];
//    ccDrawColor4B(46, 24, 8, 255);
//    glLineWidth(15);
//    ccDrawLine(ccp(-10, 86), ccp(5, 84));
    
}
- (void)initElements:(cpSpace *)space{
    space_ = space;
    cpBody *staticBody = cpSpaceGetStaticBody(space_);
    cpBodySetPos(body_, INIT_POSITION);
    cpSpaceAddBody(space_, body_);
    
    shape_ = cpBoxShapeNew(staticBody, WIDTH, HEIGHT);
	cpShapeSetElasticity( shape_, 0.0f );
	cpShapeSetFriction( shape_, 0.5f );
    cpShapeSetCollisionType(shape_, COLLISION_TYPE);
    cpShapeSetLayers(shape_, 1);
    
	cpSpaceAddShape(space_, shape_);
    cpBodySetAngVelLimit(staticBody, 0);
    //cpBodySleep(body_);
    cpSpaceAddConstraint(space_, cpPivotJointNew(staticBody, body_, cpBodyGetPos(body_)));
}
@end
