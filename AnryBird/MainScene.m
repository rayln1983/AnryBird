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
        NSLog(@"====mainscene=========%i", _bird.value);
        space_ = cpSpaceNew();
        
        
    }
    return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"====touch===%i", _bird.value);
}

- (void)didLoadFromCCB{
    NSLog(@"===didLoadFromCCB======");
    NSLog(@"====touch===%i", _bird.value);
    [_bird initElements:space_];
}

@end
