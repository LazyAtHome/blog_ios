//
//  SecondViewController.m
//  blog
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogPostViewController.h"
#import "RFMarkdownTextView.h"
#import "BlogPreviewViewController.h"
#import "UIViewController+HUD.h"
#import "Response.h"
#import "BlogService.h"
#import "Const.h"

@interface BlogPostViewController (){
    UITextView              *_markdownEditorView;
    NSString                *_markdownText;
    NSString                *_title;
    Blog                    *_blog;
}
@property (weak, nonatomic) IBOutlet UIView *markdownContainerView;
@property (weak, nonatomic) IBOutlet UIButton *btnPreview;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitle;

@end

@implementation BlogPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(_markdownText == nil){
        _markdownText = @"";
    }
    [self.textFieldTitle setText:_title];
    [self initMarkDownEditorView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initMarkDownEditorView{
    CGRect markdownRect = CGRectMake(0.f, 0.f, self.markdownContainerView.frame.size.width, self.markdownContainerView.frame.size.height);
    _markdownEditorView = [[UITextView alloc] initWithFrame:markdownRect];
    
    // Supply the markdown view with markdown to render
    [_markdownEditorView setText:_markdownText];
    
    // Add the markdown view to a superview
    [[self markdownContainerView] addSubview:_markdownEditorView];
}
- (IBAction)preview:(id)sender {
    BlogPreviewViewController* postVC = [[BlogPreviewViewController alloc]initWithNibName:@"BlogPreviewViewController" bundle:(NSBundle *)nil];
    [postVC setPreview:_title content:_markdownText];
    [self.navigationController pushViewController:postVC animated:YES];

}

- (void)setBlog:(Blog*)blog{
    _blog = blog;
    _markdownText = blog.content;
    _title = blog.title;
}

- (IBAction)post:(id)sender{
    [self showHudWithTitle:NSLocalizedString(@"Posting", nil)];
    if(_blog != nil && _blog.id != nil){
        [[BlogService singleton]blogUpdate:[NSString stringWithFormat:@"%d",_blog.id.intValue] title:self.textFieldTitle.text content:_markdownEditorView.text delegate:self];
    }else{
        [[BlogService singleton]blogPost:self.textFieldTitle.text content:_markdownEditorView.text delegate:self];
    }
}

- (void)onSucceed:(NSDictionary*)response tag:(int)tag {
    NSLog(@"JSON: %@", response);
    [self hideHud];
    Response* blogResponse = [[Response alloc]initWithDictionary:response];
    if([blogResponse isSucceed]){
        [self showAlert:NSLocalizedString(@"Succeed", nil)];
        [[NSNotificationCenter defaultCenter] postNotificationName:KNotify_PostChanged object:nil];
        [self back];
    }else{
        [self showAlert:blogResponse.responseMsg];
    }
}

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg tag:(int)tag {
    NSLog(@"Error: %d, %@", status, errorMsg);
    [self hideHud];
}

@end
