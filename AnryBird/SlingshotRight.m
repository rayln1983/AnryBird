//
//  SlingshotRight.m
//  AnryBird
//
//  Created by Rayln Guan on 10/15/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "SlingshotRight.h"


@implementation SlingshotRight

- (void)draw{
    [super draw];
    ccDrawColor4B(46, 24, 8, 255);
    glLineWidth(15);
    ccDrawLine(ccp(-10, 86), ccp(101, 131));
    
}

@end
