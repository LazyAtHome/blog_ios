//
//  SecondViewController.m
//  blog
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogPostViewController.h"
#import "BPMarkdownView.h"
#import "RFMarkdownTextView.h"

@interface BlogPostViewController (){
    BPMarkdownView *markdownPreviewView;
    RFMarkdownTextView *markdownEditorView;
    NSString* markdownText;
}
@property (weak, nonatomic) IBOutlet UIView *markdownContainerView;
@property (weak, nonatomic) IBOutlet UIButton *btnPreview;

@end

@implementation BlogPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    markdownText = @"";
    [self initRFMarkDownView];
    [self initBPMarkDownView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initBPMarkDownView{
    CGRect markdownRect = CGRectMake(0.f, 0.f, self.markdownContainerView.frame.size.width, self.markdownContainerView.frame.size.height);
    markdownPreviewView = [[BPMarkdownView alloc] initWithFrame:markdownRect];
    
    // Obtain some markdown
    
    // Supply the markdown view with markdown to render
    [markdownPreviewView setMarkdown:markdownText];
    markdownPreviewView.hidden = YES;
    // Add the markdown view to a superview
    [[self markdownContainerView] addSubview:markdownPreviewView];
}

-(void)initRFMarkDownView{
    CGRect markdownRect = CGRectMake(0.f, 0.f, self.markdownContainerView.frame.size.width, self.markdownContainerView.frame.size.height);
    markdownEditorView = [[RFMarkdownTextView alloc] initWithFrame:markdownRect];
    
    // Supply the markdown view with markdown to render
    //[markdownEditorView setText:markdownText];
    
    // Add the markdown view to a superview
    [[self markdownContainerView] addSubview:markdownEditorView];
}
- (IBAction)preview:(id)sender {
    if(markdownPreviewView.hidden){
        markdownText = markdownEditorView.text;
        [markdownPreviewView setMarkdown:markdownText];
        markdownPreviewView.hidden = NO;
        markdownEditorView.hidden = YES;
        [markdownPreviewView layoutSubviews];
        [self.btnPreview setTitle:NSLocalizedString(@"Write", nil) forState:UIControlStateNormal];
    }else{
        markdownPreviewView.hidden = YES;
        markdownEditorView.hidden = NO;
        [self.btnPreview setTitle:NSLocalizedString(@"Preview", nil) forState:UIControlStateNormal];
    }
}
@end
