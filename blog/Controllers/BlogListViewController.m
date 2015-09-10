//
//  FirstViewController.m
//  blog
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogListViewController.h"
#import "NetQuery.h"

@interface BlogListViewController ()<NetQueryDelegate>

@end

@implementation BlogListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onSucceed:(NSDictionary*)response{
    NSLog(@"JSON: %@", response);
    
}

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg{
    NSLog(@"Error: %d, %@", status, errorMsg);
}

@end
