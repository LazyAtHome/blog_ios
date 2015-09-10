//
//  NetQuery.h
//  blog
//
//  Created by peter on 15/9/10.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetQueryDelegate.h"

@interface NetQuery : NSObject

@property (nonatomic,weak) id<NetQueryDelegate> delegate;
@property (nonatomic,copy) NetQuerySucceed onSucceed;
@property (nonatomic,copy) NetQueryFailed onFailed;

- (void)httpGet:(NSString*)url params:(NSDictionary*)params tag:(int)tag;
- (void)httpPost:(NSString*)url params:(NSDictionary*)params tag:(int)tag;

@end
