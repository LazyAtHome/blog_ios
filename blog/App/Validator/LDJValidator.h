//
//  LDJValidator.h
//  Blog
//
//  Created by peter on 15/9/17.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDJValidator : NSObject

-(Boolean)isValidUserName:(NSString*)userName;
-(Boolean)isValidPassword:(NSString*)password;
@end
