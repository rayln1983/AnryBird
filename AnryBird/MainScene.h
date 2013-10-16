//
//  MainScene.h
//  AnryBird
//
//  Created by rayln on 13-10-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCBReader.h"
#import "chipmunk.h"
#import "Bird.h"
#import "SlingshotLeft.h"
#import "SlingshotRight.h"

@interface MainScene : CCLayer {
    cpSpace *space_;
    cpShape *walls_[4];
    cpShape *move;
}
@property (nonatomic, assign) CGSize winSize;
@property (nonatomic, strong) Bird *bird;
@property (nonatomic, strong) SlingshotLeft *slingshotLeft;
@property (nonatomic, strong) SlingshotRight *slingshotRight;

@end
