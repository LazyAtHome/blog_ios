//
//  Blog.m
//  Blog
//
//  Created by peter on 15/9/18.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "Blog.h"

@implementation Blog
-(instancetype)initWithDictionary:(NSDictionary*)dic{
    self = [super init];
    if(dic == nil){
        return self;
    }
    self.title = [dic objectForKey:@"title"];
    self.content = [dic objectForKey:@"content"];
    return self;
}

@end
