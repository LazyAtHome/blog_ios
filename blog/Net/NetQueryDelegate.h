//
//  NetQueryDelegate.h
//  Blog
//
//  Created by peter on 15/9/10.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef void(^NetQuerySucceed)(NSDictionary *);

typedef void(^NetQueryFailed)(int,NSString*);

@protocol NetQueryDelegate <NSObject>

- (void)onSucceed:(NSDictionary*)response tag:(int)tag;

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg tag:(int)tag;

@end
