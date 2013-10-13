//
//  Bird.m
//  AnryBird
//
//  Created by rayln on 13-10-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Bird.h"


@implementation Bird

- (id)init{
    if (self = [super init]) {
        _value = 2;
        NSLog(@"=====bird==init==========");
        body_ = cpBodyNew(1.0f, cpMomentForCircle(1.0f, 12.0f, 12.0f, CGPointZero));
        cpBodySetPos(body_, ccp(100, 100));
    }
    return self;
}

- (void)initElements:(cpSpace *)space{
    NSLog(@"=====bird==initElements==========");
    space_ = space;
    cpBodySetPos(body_, ccp(200, 200));
    cpSpaceAddBody(space_, body_);
    
    int num = 4;
	cpVect verts[] = {
		cpv(-24,-54),
		cpv(-24, 54),
		cpv( 24, 54),
		cpv( 24,-54),
	};
    cpShape* shape = cpPolyShapeNew(body_, num, verts, CGPointZero);
	cpShapeSetElasticity( shape, 0.5f );
	cpShapeSetFriction( shape, 0.5f );
	cpSpaceAddShape(space_, shape);
    //self.position = ccp(100, 100);
}

@end
