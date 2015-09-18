//
//  NetQuery.m
//  blog
//
//  Created by peter on 15/9/10.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "NetQuery.h"
#import <AFNetworking/AFNetworking.h>

@implementation NetQuery
@synthesize delegate = _delegate;

-(instancetype)initWithDelegate:(id)delegate{
    self = [super init];
    self.delegate = delegate;
    return self;
}

- (void)httpGet:(NSString*)url params:(NSDictionary*)params tag:(int)tag{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if(_delegate != nil && [_delegate respondsToSelector:@selector(onSucceed:tag:)]){
            [_delegate onSucceed:responseObject tag:tag];
        }
        if(_onSucceed){
            _onSucceed(params);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if(_delegate != nil && [_delegate respondsToSelector:@selector(onFailed:errorMsg:tag:)]){
            [_delegate onFailed:(int)error.code errorMsg:error.localizedDescription tag:tag];
        }
        if(_onFailed){
            _onFailed((int)error.code,error.localizedDescription);
        }
    }];
}

- (void)httpPost:(NSString*)url params:(NSDictionary*)params tag:(int)tag {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if(_delegate != nil && [_delegate respondsToSelector:@selector(onSucceed:tag:)]){
            [_delegate onSucceed:responseObject tag:tag];
        }
        if(_onSucceed){
            _onSucceed(params);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if(_delegate != nil && [_delegate respondsToSelector:@selector(onFailed:errorMsg:tag:)]){
            [_delegate onFailed:(int)error.code errorMsg:error.localizedDescription tag:tag];
        }
        if(_onFailed){
            _onFailed((int)error.code,error.localizedDescription);
        }
    }];
}

- (void)httpPut:(NSString*)url params:(NSDictionary*)params tag:(int)tag {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager PUT:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if(_delegate != nil && [_delegate respondsToSelector:@selector(onSucceed:tag:)]){
            [_delegate onSucceed:responseObject tag:tag];
        }
        if(_onSucceed){
            _onSucceed(params);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if(_delegate != nil && [_delegate respondsToSelector:@selector(onFailed:errorMsg:tag:)]){
            [_delegate onFailed:(int)error.code errorMsg:error.localizedDescription tag:tag];
        }
        if(_onFailed){
            _onFailed((int)error.code,error.localizedDescription);
        }
    }];
}

- (void)httpDelete:(NSString*)url params:(NSDictionary*)params tag:(int)tag {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager DELETE:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if(_delegate != nil && [_delegate respondsToSelector:@selector(onSucceed:tag:)]){
            [_delegate onSucceed:responseObject tag:tag];
        }
        if(_onSucceed){
            _onSucceed(params);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if(_delegate != nil && [_delegate respondsToSelector:@selector(onFailed:errorMsg:tag:)]){
            [_delegate onFailed:(int)error.code errorMsg:error.localizedDescription tag:tag];
        }
        if(_onFailed){
            _onFailed((int)error.code,error.localizedDescription);
        }
    }];
}
@end
