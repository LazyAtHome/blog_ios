//
//  BlogService.m
//  Blog
//
//  Created by peter on 15/9/18.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogService.h"
#import "NetQuery.h"
#import "Const.h"

@implementation BlogService

-(void)blogPost:(NSString*)title content:(NSString*)content delegate:(id)delegate {
    
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    if(title != nil){
        [dic setObject:title forKey:@"title"];
    }
    if(content != nil){
        [dic setObject:content forKey:@"content"];
    }
    [netQuery httpPost:URL_BLOG_POST params:dic tag:TAG_NETQUERY_BLOG_POST];
}

@end
