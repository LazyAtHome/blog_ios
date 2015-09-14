//
//  FirstViewController.m
//  blog
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogListViewController.h"
#import "BlogTableViewCell.h"
#import "NetQuery.h"

@interface BlogListViewController ()<UITableViewDelegate,NetQueryDelegate>{

    IBOutlet UITableView* _tableView;
}

@end

@implementation BlogListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onSucceed:(NSDictionary*)response tag:(int)tag {
    NSLog(@"JSON: %@", response);
    
}

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg tag:(int)tag {
    NSLog(@"Error: %d, %@", status, errorMsg);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BlogTableViewCell* cell = [[[NSBundle mainBundle]loadNibNamed:@"BlogTableViewCell" owner:self options:nil]objectAtIndex:0];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 135;
}

@end
