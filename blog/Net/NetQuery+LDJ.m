//
//  NetQuery+LDJ.m
//  Blog
//
//  Created by peter on 15/9/21.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "NetQuery+LDJ.h"
#import <AFNetworking/AFNetworking.h>
#import "LoginManager.h"

@implementation NetQuery(LDJ)

- (void)addCommonHeaders:(AFHTTPRequestOperationManager*)manager {
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    if([[LoginManager singleton ] isLogined]){
        
        [manager.requestSerializer setValue:[[LoginManager singleton] getAcessToken] forHTTPHeaderField:@"accessToken"];
    }
}
@end
