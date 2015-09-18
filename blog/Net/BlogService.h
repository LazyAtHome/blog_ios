//
//  BlogService.h
//  Blog
//
//  Created by peter on 15/9/18.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Singleton.h"

@interface BlogService : NSObject

-(void)blogPost:(NSString*)title content:(NSString*)content delegate:(id)delegate;

-(void)blogUpdate:(NSString*)blogId title:(NSString*)title content:(NSString*)content delegate:(id)delegate;

-(void)blogDelete:(NSString*)blogId delegate:(id)delegate;

-(void)blogsGetAll:(id)delegate;

-(void)blogsGetById:(NSString*)blogId delegate:(id)delegate;

@end
