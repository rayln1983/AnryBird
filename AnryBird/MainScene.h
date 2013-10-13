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

@interface MainScene : CCLayer {
    cpSpace *space_;

}
@property (nonatomic, strong) Bird *bird;

@end
