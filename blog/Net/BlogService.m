//
//  BlogService.m
//  Blog
//
//  Created by peter on 15/9/18.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogService.h"
#import "NetQuery+LDJ.h"
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
-(void)blogUpdate:(NSString*)blogId title:(NSString*)title content:(NSString*)content delegate:(id)delegate{
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    if(title != nil){
        [dic setObject:title forKey:@"title"];
    }
    if(content != nil){
        [dic setObject:content forKey:@"content"];
    }
    NSString* url = [[NSString alloc]initWithFormat:@"%@/%@" ,URL_BLOG_UPDATE,blogId];
    [netQuery httpPut:url params:dic tag:TAG_NETQUERY_BLOG_UPDATE];
}
    
-(void)blogDelete:(NSString*)blogId delegate:(id)delegate{
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    NSString* url = [[NSString alloc]initWithFormat:@"%@/%@" ,URL_BLOG_DELETE,blogId];
    [netQuery httpDelete:url params:nil tag:TAG_NETQUERY_BLOG_GETBYID];
}


-(void)blogsGetAll:(id)delegate{
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@"1" forKey:@"page"];
    [dic setObject:@"10" forKey:@"limit"];
    [netQuery httpGet:URL_BLOG_GETALL params:dic tag:TAG_NETQUERY_BLOG_GETALL];
}

-(void)blogsGetById:(NSString*)blogId delegate:(id)delegate{
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    NSString* url = [[NSString alloc]initWithFormat:@"%@/%@" ,URL_BLOG_GETBYID,blogId];
    [netQuery httpGet:url params:nil tag:TAG_NETQUERY_BLOG_GETBYID];
}
@end
