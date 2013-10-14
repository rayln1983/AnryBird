//
//  MainScene.m
//  AnryBird
//
//  Created by rayln on 13-10-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"


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
    cpSpaceSetGravity( space_, cpv(0, -100) );
	//
	// rogue shapes
	// We have to free them manually
	//
	// bottom
	walls_[0] = cpSegmentShapeNew( space_->staticBody, cpv(0,50), cpv(_winSize.width,50), 0.0f);
	// top
	walls_[1] = cpSegmentShapeNew( space_->staticBody, cpv(0,_winSize.height), cpv(_winSize.width,_winSize.height), 0.0f);
	// left
	walls_[2] = cpSegmentShapeNew( space_->staticBody, cpv(0,50), cpv(0,_winSize.height), 0.0f);
	// right
	walls_[3] = cpSegmentShapeNew( space_->staticBody, cpv(_winSize.width,50), cpv(_winSize.width,_winSize.height), 0.0f);
	
	for( int i=0;i<4;i++) {
		cpShapeSetElasticity( walls_[i], 1.0f );
		cpShapeSetFriction( walls_[i], 1.0f );
		cpSpaceAddStaticShape(space_, walls_[i] );
	}
}
- (void)initWall{
    
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
    cpBodySetVel([_bird getBody], ccp(100, 100));
}

- (void)dealloc{
    [_bird release];
    [super dealloc];
}

@end
