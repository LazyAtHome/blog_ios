//
//  UserService.h
//  Blog
//
//  Created by peter on 15/9/16.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetQueryDelegate.h"
#import <NSObject+Singleton.h>

@interface UserService : NSObject

-(void)register:(NSString*)userName password:(NSString*)password delegate:(id)delegate;
-(void)login:(NSString*)userName password:(NSString*)password delegate:(id)delegate;

-(void)logout:(id)delegate;

-(void)current:(id)delegate;

@end
