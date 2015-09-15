//
//  blogTests.m
//  blogTests
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NetQuery.h"

@interface blogTests : XCTestCase<NetQueryDelegate>

@end

@implementation blogTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNetQuerySucceed {
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.delegate = self;
    [netQuery httpPost:@"http://uas.landaojia.com/userappserver-web/user/isRegisted.do?mpNo=13210000001" params:nil tag:0];
    
    XCTAssert(YES, @"Pass");
}

- (void)testNetQueryFailed {
    NetQuery* netQuery = [[NetQuery alloc]init];
    netQuery.onSucceed = ^(NSDictionary* response){
        NSLog(@"JSON: %@", response);
        XCTAssert(YES, @"Pass");
    };
    netQuery.onFailed = ^(int status,NSString* errorMsg){
        NSLog(@"Error: %d, %@", status, errorMsg);
        XCTAssert(YES, @"Pass");
    };
    [netQuery httpGet:@"http://www.sina.com.cn" params:nil tag:0];
    sleep(1);
}

- (void)onSucceed:(NSDictionary*)response tag:(int)tag {
    NSLog(@"JSON: %@", response);
}

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg tag:(int)tag {
    NSLog(@"Error: %d, %@", status, errorMsg);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
