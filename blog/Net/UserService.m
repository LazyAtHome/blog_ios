//
//  UserService.m
//  Blog
//
//  Created by peter on 15/9/16.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "UserService.h"
#import "NetQuery.h"
#import "Const.h"

static UserService * _sharedUserService = nil;

@implementation UserService

+(UserService *)sharedUserService
{
    @synchronized([UserService class])
    {
        if(!_sharedUserService)
        {
            _sharedUserService = [[self alloc]init];
        }
        
        return _sharedUserService;
    }
    
    return nil;
}

-(void)register:(NSString*)userName password:(NSString*)password delegate:(id)delegate{
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    NSString* url = [[NSString alloc]initWithFormat:@"%@/users/reg",HTTP_PREFIX];
    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    [dic setObject:userName forKey:@"userName"];
    [dic setObject:password forKey:@"cryptedPassword"];
    [dic setObject:password forKey:@"cryptedPasswordConfirm"];
    [dic setObject:userName forKey:@"email"];
    [netQuery httpPost:url params:nil tag:TAG_NETQUERY_REGISTER];
}

-(void)login:(NSString*)userName password:(NSString*)password delegate:(id)delegate{
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    NSString* url = [[NSString alloc]initWithFormat:@"%@/users/login",HTTP_PREFIX];
    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    [dic setObject:userName forKey:@"userName"];
    [dic setObject:password forKey:@"password"];
    [netQuery httpPost:url params:nil tag:TAG_NETQUERY_LOGIN];
}

-(void)logout:(id)delegate{
    
}

-(void)current:(id)delegate{
    
}

@end
