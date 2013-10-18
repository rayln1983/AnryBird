//
//  PhysicsSprite.h
//  AnryBird
//
//  Created by Rayln Guan on 10/11/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import "cocos2d.h"
#import "chipmunk.h"

@interface PhysicsSprite : CCSprite{
	cpBody *body_;	// strong ref
    cpSpace *space_;
    cpShape *shape_;
}

-(void) setPhysicsBody:(cpBody*)body;
-(void) setPhysicsSpace:(cpSpace*)space;
-(cpBody *)getBody;
@end