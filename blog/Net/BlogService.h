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

@end
