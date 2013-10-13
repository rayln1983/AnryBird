//
//  StartMain.m
//  AnryBird
//
//  Created by rayln on 13-10-13.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "StartMain.h"


@implementation StartMain

- (void)startWar:(id)sender{
    CCScene *s = [CCBReader sceneWithNodeGraphFromFile:@"Main.ccbi"];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:s withColor:ccWHITE]];
}

@end
