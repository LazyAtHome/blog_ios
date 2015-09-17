//
//  User.m
//  Blog
//
//  Created by peter on 15/9/17.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "User.h"

@implementation User
-(instancetype)initWithDictionary:(NSDictionary*)dic{
    self = [super init];
    if(dic == nil){
        return self;
    }
    self.userName = [dic objectForKey:@"userName"];    
    return self;
}


@end
