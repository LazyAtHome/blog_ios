//
//  FirstViewController.m
//  blog
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogListViewController.h"
#import "BlogPostViewController.h"
#import "UIViewController+HUD.h"
#import "BlogTableViewCell.h"
#import "NetQuery.h"
#import "BlogService.h"
#import "Page+Blog.h"
#import "Response.h"
#import "Blog.h"

@interface BlogListViewController ()<UITableViewDelegate,NetQueryDelegate>{

    IBOutlet UITableView* _tableView;
    Page* blogPage;
}

@end

@implementation BlogListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getBlogs];
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
    
}

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg tag:(int)tag {
    NSLog(@"Error: %d, %@", status, errorMsg);
    [self hideHud];
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
    [cell.title setText:blog.title];
    [cell.content setText:blog.content];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 135;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    BlogPostViewController* postVC = [[BlogPostViewController alloc]initWithNibName:@"BlogPostViewController" bundle:(NSBundle *)nil];
    Blog* blog = [blogPage.dataList objectAtIndex:indexPath.row];
    [postVC showPreviewOnly:blog];
    [self.navigationController pushViewController:postVC animated:YES];
}

- (IBAction)gotoPost:(id)sender {
    BlogPostViewController* postVC = [[BlogPostViewController alloc]initWithNibName:@"BlogPostViewController" bundle:(NSBundle *)nil];
    [self.navigationController pushViewController:postVC animated:YES];
}
@end
