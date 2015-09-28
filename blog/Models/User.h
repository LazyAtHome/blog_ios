//
//  User.h
//  Blog
//
//  Created by peter on 15/9/17.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

-(instancetype)initWithDictionary:(NSDictionary*)dic;

@property NSString* userName;
@property NSString* accessToken;
@property NSNumber* id;

@end
