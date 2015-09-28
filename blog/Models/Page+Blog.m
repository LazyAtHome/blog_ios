//
//  Page+Blog.m
//  Blog
//
//  Created by peter on 15/9/18.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "Page+Blog.h"
#import "Blog.h"

@implementation Page (Blog)

-(void)fill:(NSDictionary *)dic{
    if(dic == nil){
        return;
    }
    NSArray* blogs = [dic objectForKey:@"posts"];
    if(blogs == nil){
        return;
    }
    
    self.dataList = [[NSMutableArray alloc]init];
    for(int i =0 ; i < [blogs count];i++){
        Blog* blog = [[Blog alloc]initWithDictionary:[blogs objectAtIndex:i]];
        [self.dataList addObject:blog];
    }
}
@end
