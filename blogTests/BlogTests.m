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
#import "Response.h"
#import "User.h"
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
    [dateFormatter setDateFormat:@"HH_mm_ss"];
    NSString* userName = [[NSString alloc]initWithFormat:@"%@@126.com",[dateFormatter stringFromDate:[[NSDate alloc]init]] ];
    NSString* password = @"1234567890";
    [[UserService sharedUserService] register:userName password:password delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)testLogin {
    [[UserService sharedUserService] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    [self testCurrent];
}

- (void)testLogout {
    [[UserService sharedUserService] logout:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)testCurrent {
    [[UserService sharedUserService] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    [[UserService sharedUserService] current:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)onSucceed:(NSDictionary*)response tag:(int)tag {
    
    NSLog(@"JSON: %@", response);
    
    Response* succResponse = [[Response alloc]initWithDictionary:response];
    if([succResponse isSucceed]){
        [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
        XCTAssert(YES, "succeed");
    }else{
        [self XCA_notify:XCTAsyncTestCaseStatusFailed];
        XCTAssert(NO, "failed");
        return;
    }
    switch(tag){
        case TAG_NETQUERY_LOGIN:
            NSLog(@"Login Succeed");
            if(succResponse.data != nil){
                User* user = [[User alloc]initWithDictionary:succResponse.data];
                NSLog(user.userName);
            }
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
    XCTAssert(NO, "failed");
    NSLog(@"Error: %d, %@", status, errorMsg);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
