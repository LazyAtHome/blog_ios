//
//  Page.h
//  Blog
//
//  Created by peter on 15/9/18.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Page : NSObject
-(instancetype)initWithDictionary:(NSDictionary*)dic;
-(void)fillWithPageInfo:(NSDictionary*)dic;
-(void)fill:(NSDictionary *)dic;

@property NSMutableArray* dataList;

@property int page;
@property int pageSize;
@property int totalCount;
@property int totalPages;

@end
