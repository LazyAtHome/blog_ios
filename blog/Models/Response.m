//
//  Response.m
//  Blog
//
//  Created by peter on 15/9/17.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "Response.h"

@implementation Response
-(instancetype)initWithDictionary:(NSDictionary*)dic{
    self = [super init];
    if(dic == nil){
        return self;
    }
    self.responseCode = [dic objectForKey:@"responseCode"];
    self.responseMsg = [dic objectForKey:@"responseMsg"];
    self.now = [dic objectForKey:@"now"];
    self.data = [dic objectForKey:@"data"];
    
    return self;
}


-(BOOL)isSucceed{
    return self.responseCode != nil && self.responseCode.intValue == 0;
}
@end
