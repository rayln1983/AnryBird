//
//  Bird.h
//  AnryBird
//
//  Created by rayln on 13-10-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PhysicsSprite.h"

@interface Bird : PhysicsSprite {
    
}
@property (nonatomic, assign) int value;

- (void)initElements:(cpSpace *)space;

@end
