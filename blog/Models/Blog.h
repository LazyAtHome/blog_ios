//
//  Blog.h
//  Blog
//
//  Created by peter on 15/9/18.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Blog : NSObject

-(instancetype)initWithDictionary:(NSDictionary*)dic;

@property NSNumber* id;
@property NSString* title;
@property NSString* content;
@property NSNumber* userId;
@property NSNumber* version;
@property NSNumber* viewCount;
@property NSString* createBy;
@property NSString* createDate;
@property NSString* updateBy;
@property NSString* updateDate;

@end
