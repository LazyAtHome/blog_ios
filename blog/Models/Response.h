//
//  Response.h
//  Blog
//
//  Created by peter on 15/9/17.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response : NSObject

-(instancetype)initWithDictionary:(NSDictionary*)dic;

@property NSNumber* responseCode;
@property NSString* responseMsg;
@property NSDictionary* data;
@property NSString* now;

-(BOOL)isSucceed;

@end
