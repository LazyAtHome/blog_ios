//
//  Page.m
//  Blog
//
//  Created by peter on 15/9/18.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "Page.h"

@implementation Page
-(instancetype)initWithDictionary:(NSDictionary*)dic{
    self = [super init];
    if(dic == nil){
        return self;
    }
    NSDictionary* pageInfo =  [dic objectForKey:@"pageInfo"];
    if(pageInfo != nil){
        [self fillWithPageInfo:pageInfo];
    }
    if( [self respondsToSelector:@selector(fill:)]){
        [self fill:dic];
    }
    return self;
}
-(void)fillWithPageInfo:(NSDictionary*)dic{
    
    if(dic == nil){
        return;
    }
    NSNumber* number = [dic objectForKey:@"page"];
    if(number != nil){
        self.page = number.intValue;
    }
    number = [dic objectForKey:@"limit"];
    if(number != nil){
        self.pageSize = number.intValue;
    }
    number = [dic objectForKey:@"totalCount"];
    if(number != nil){
        self.totalCount = number.intValue;
    }
    number = [dic objectForKey:@"totalPages"];
    if(number != nil){
        self.totalPages = number.intValue;
    }
}
@end
