//
//  LoginManager.h
//  Blog
//
//  Created by peter on 15/9/21.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSObject+Singleton.h>
#import "User.h"

@interface LoginManager : NSObject
-(void)loginSucceed:(User*)user;
-(void)logout;
-(Boolean)isLogined;
-(NSString*)getAcessToken;
@end
