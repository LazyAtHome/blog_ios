//
//  FirstViewController.m
//  blog
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogListViewController.h"
#import "BlogPostViewController.h"
#import "BlogPreviewViewController.h"
#import "UIViewController+HUD.h"
#import "BlogTableViewCell.h"
#import "NetQuery.h"
#import "BlogService.h"
#import "Page+Blog.h"
#import "Response.h"
#import "Blog.h"
#import <MJRefresh/MJRefresh.h>
#import <MJRefresh/UIScrollView+MJRefresh.h>

@interface BlogListViewController ()<UITableViewDelegate,NetQueryDelegate>{

    IBOutlet UITableView* _tableView;
    Page* blogPage;
}

@end

@implementation BlogListViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];// Do any additional setup after loading the view, typically from a nib.
    [self setupRefresh:_tableView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onSucceed:(NSDictionary*)response tag:(int)tag {
    NSLog(@"JSON: %@", response);
    [self hideHud];
    Response* blogResponse = [[Response alloc]initWithDictionary:response];
    if([blogResponse isSucceed]){
        blogPage = [[Page alloc]initWithDictionary:blogResponse.data];
        [_tableView reloadData];
    }else{
        [self showAlert:blogResponse.responseMsg];
    }
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [_tableView.header endRefreshing];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [_tableView.footer endRefreshing];
    
}

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg tag:(int)tag {
    NSLog(@"Error: %d, %@", status, errorMsg);
    [self hideHud];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [_tableView.header endRefreshing];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [_tableView.footer endRefreshing];
}

-(void)getBlogs {
    [self showHud];
    [[BlogService singleton]blogsGetAll:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(blogPage == nil || blogPage.dataList == nil){
        return 0;
    }
    return [blogPage.dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BlogTableViewCell* cell = [[[NSBundle mainBundle]loadNibNamed:@"BlogTableViewCell" owner:self options:nil]objectAtIndex:0];
    Blog* blog = [blogPage.dataList objectAtIndex:indexPath.row];
    [cell fill:blog];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    BlogPreviewViewController* postVC = [[BlogPreviewViewController alloc]initWithNibName:@"BlogPreviewViewController" bundle:(NSBundle *)nil];
    Blog* blog = [blogPage.dataList objectAtIndex:indexPath.row];
    [postVC setBlog:blog];
    [self.navigationController pushViewController:postVC animated:YES];
}

- (IBAction)gotoPost:(id)sender {
    BlogPostViewController* postVC = [[BlogPostViewController alloc]initWithNibName:@"BlogPostViewController" bundle:(NSBundle *)nil];
    [self.navigationController pushViewController:postVC animated:YES];
}


/**
 *  集成刷新控件
 */
- (void)setupRefresh:(UITableView*)tableView
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    tableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    // 马上进入刷新状态
    [tableView.header beginRefreshing];
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    // 2.刷新表格
    [_tableView reloadData];
    
    [self getBlogs];
}

- (void)footerRereshing
{
    // 2.2秒后刷新表格UI
    // 刷新表格
    [_tableView reloadData];
    
    [self getBlogs];
}


@end
