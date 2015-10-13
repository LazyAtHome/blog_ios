//
//  blogTests.m
//  blogTests
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "blog-Swift.h"
#import <XCTest/XCTest.h>
#import "XCTestCase+AsyncTesting.h"
#import "NetQuery.h"
#import "UserService.h"
#import "BlogService.h"
#import "Response.h"
#import "User.h"
#import "Const.h"
#import "Page+Blog.h"
#import "NetQuery+LDJ.h"
#import "LoginManager.h"
#import <EasyIOS/Action.h>
#import <ReactiveCocoa/RACEXTScope.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

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
    [[UserService singleton] register:userName password:password delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)testLogin {
    [[UserService singleton] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    [self testCurrent];
}

- (void)testLogout {
    [[UserService singleton] logout:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

-(void)testBlogPost {
    [[UserService singleton] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    
    [[BlogService singleton] blogPost:@"Test Blog" content:@"Test Content" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}
-(void)testBlogUpdate {
    [[UserService singleton] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    
    [[BlogService singleton] blogUpdate:@"1" title:@"Test Blog Update" content:@"Test Content" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

-(void)testBlogDelete {
    [[UserService singleton] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    
    [[BlogService singleton] blogPost:@"Test Blog" content:@"Test Content" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    
    [[BlogService singleton] blogDelete:@"2" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

-(void)testBlogsGetAll {
    [[BlogService singleton] blogsGetAll:@"1" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

-(void)testBlogsGetById {
    [[BlogService singleton] blogsGetById:@"1" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)testCurrent {
    [[UserService singleton] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    [[UserService singleton] current:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)testBlogPostFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString *path = [docDir  stringByAppendingPathComponent:@"Array.plist"];
    NSString *content = @"abcd";
    [content writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"zip"];
    NSURL* fileURL = [NSURL fileURLWithPath:path];
    NSError* error = [[NSError alloc]init];
    Boolean reachable = [fileURL checkResourceIsReachableAndReturnError:&error];
    
    [[UserService singleton] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    Action* action = [Action Action];
    Request* request = [[Request alloc]init];
    request.SCHEME = @"http";
    request.HOST = @"jason.tunnel.mobi";
    request.PATH = @"/blogserver/posts/uploadFile/158";//158,10
    request.METHOD = @"POST";
    NSMutableDictionary* dic = [[NSMutableDictionary alloc ]init];
    if([[LoginManager singleton ] isLogined]){
        
        [dic setObject:[[LoginManager singleton] getAcessToken] forKey:@"accessToken"];
    }
    [dic setObject:@"multipart/form-data" forKey:@"Content-Type"];
    request.httpHeaderFields = dic;
    
    NSMutableDictionary* files = [[NSMutableDictionary alloc ]init];
    [files setObject:path forKey:@"file"];
    request.requestFiles = files;
    
    [[RACObserve(request, state) //监控 网络请求的状态
      filter:^BOOL(NSNumber *state) { //过滤请求状态
          return request.succeed;
      }]
     subscribeNext:^(NSNumber *state) {
         NSError *error;
         [request.output objectForKey:@"Data"];
         [self XCA_notify:XCTAsyncTestCaseStatusSucceeded];
     }];
    
    [action Send:request];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0*600];
}


- (void)testBlogComment {
    [[UserService singleton] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    
    [[[CommentService alloc]init] comment:@"Comment From peterwang" postId:158 delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)testBlogCommentUpdate {
    [[UserService singleton] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    
    [[[CommentService alloc]init] commentUpdate:@"Update Comment From peterwang" postId:158 commentId:1 delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)testBlogCommentDelete {
    [[UserService singleton] login:@"peterwang" password:@"1234567" delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
    
    [[[CommentService alloc]init] commentDelete:2 delegate:self];
    [self XCA_waitForStatus:XCTAsyncTestCaseStatusSucceeded timeout:10.0];
}

- (void)onSucceed:(NSDictionary*)response tag:(int)tag {
    
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
                NSLog(@"%@",user);
                [[LoginManager singleton]loginSucceed:user];
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
        case TAG_NETQUERY_BLOG_POST:
            NSLog(@"Blog Post Succeed");
            break;
        case TAG_NETQUERY_BLOG_GETALL:
            NSLog(@"Blog List Succeed");
            if(succResponse.data != nil){
                Page* page = [[Page alloc]initWithDictionary:succResponse.data];
                NSLog(@"%@",page);
            }
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
