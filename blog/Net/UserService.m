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
@implementation UserService

-(void)register:(NSString*)userName password:(NSString*)password delegate:(id)delegate{
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    [dic setObject:userName forKey:@"userName"];
    [dic setObject:password forKey:@"cryptedPassword"];
    [dic setObject:password forKey:@"cryptedPasswordConfirm"];
    [dic setObject:userName forKey:@"email"];
    [netQuery httpPost:URL_REGISTER params:dic tag:TAG_NETQUERY_REGISTER];
}

-(void)login:(NSString*)userName password:(NSString*)password delegate:(id)delegate{
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    [dic setObject:userName forKey:@"userName"];
    [dic setObject:password forKey:@"password"];
    [netQuery httpPost:URL_LOGIN params:dic tag:TAG_NETQUERY_LOGIN];
}

-(void)logout:(id)delegate{
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    [netQuery httpGet:URL_LOGOUT params:nil tag:TAG_NETQUERY_LOGOUT];
}

-(void)current:(id)delegate{
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = delegate;
    [netQuery httpGet:URL_CURRENT params:nil tag:TAG_NETQUERY_CURRENT];
}

@end
