//
//  Bird.m
//  AnryBird
//
//  Created by rayln on 13-10-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//
#define INIT_POSITION ccp(50,159)

#import "Bird.h"

@implementation Bird

- (id)init{
    if (self = [super init]) {
        body_ = cpBodyNew(1.0f, cpMomentForCircle(1.0f, 12.0f, 12.0f, CGPointZero));
    }
    return self;
}

- (void)initElements:(cpSpace *)space{
    space_ = space;
    cpBodySetPos(body_, INIT_POSITION);
    
    cpSpaceAddBody(space_, body_);
    
    cpShape* shape = cpCircleShapeNew(body_, 12.0f, CGPointZero);
	cpShapeSetElasticity( shape, 0.5f );
	cpShapeSetFriction( shape, 0.5f );
	cpSpaceAddShape(space_, shape);
    //self.position = ccp(100, 100);
}
- (void)draw{
    [super draw];
}
@end
