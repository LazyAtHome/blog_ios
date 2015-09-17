//
//  blogTests.m
//  blogTests
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "XCTestCase+AsyncTesting.h"
#import "NetQuery.h"
#import "UserService.h"
#import "Const.h"

@interface blogTests : XCTestCase<NetQueryDelegate>{
}

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
- (void)testRegister {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy_MM_dd_HH_mm_ss"];
    NSString* userName = [dateFormatter stringFromDate:[[NSDate alloc]init]];
    NSString* password = @"123456";
    [[UserService sharedUserService] register:userName password:password delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)testLogin {
    [[UserService sharedUserService] login:@"13817048334" password:@"123456" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)testLogout {
    [[UserService sharedUserService] logout:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)testCurrent {
    [[UserService sharedUserService] current:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    
}

- (void)onSucceed:(NSDictionary*)response tag:(int)tag {
    switch(tag){
        case TAG_NETQUERY_LOGIN:
            NSLog(@"Login Succeed");
            break;
        case TAG_NETQUERY_REGISTER:
            NSLog(@"Register Succeed");
            break;
        case TAG_NETQUERY_LOGOUT:
            NSLog(@"Logout Succeed");
            break;
        case TAG_NETQUERY_CURRENT:
            NSLog(@"Get Current User Succeed");
            break;
    }
    
    NSLog(@"JSON: %@", response);
    [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
    XCTAssert(NO, "succeed");
}

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg tag:(int)tag {
    switch(tag){
        case TAG_NETQUERY_LOGIN:
            NSLog(@"Login Failed");
            break;
        case TAG_NETQUERY_REGISTER:
            NSLog(@"Register Failed");
            break;
        case TAG_NETQUERY_LOGOUT:
            NSLog(@"Logout Failed");
            break;
        case TAG_NETQUERY_CURRENT:
            NSLog(@"Get Current User Failed");
            break;
    }
    [self XCA_notify:XCTAsyncTestCaseStatusFailed];
    NSLog(@"Error: %d, %@", status, errorMsg);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
