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
    self.id = [dic objectForKey:@"id"];
    self.userId = [dic objectForKey:@"userId"];
    self.version = [dic objectForKey:@"version"];
    self.viewCount = [dic objectForKey:@"viewCount"];
    
    self.createBy = [dic objectForKey:@"createBy"];
    self.createDate = [dic objectForKey:@"createDate"];
    self.updateBy = [dic objectForKey:@"updateBy"];
    self.updateDate = [dic objectForKey:@"updateDate"];
    return self;
}

@end
