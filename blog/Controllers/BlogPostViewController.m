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
    BPMarkdownView          *_markdownPreviewView;
    RFMarkdownTextView      *_markdownEditorView;
    NSString                *_markdownText;
    Blog                    *_blog;
}
@property (weak, nonatomic) IBOutlet UIView *markdownContainerView;
@property (weak, nonatomic) IBOutlet UIButton *btnPreview;

@end

@implementation BlogPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(_markdownText == nil){
        _markdownText = @"";
    }
    [self initRFMarkDownView];
    [self initBPMarkDownView];
    
    if(_blog != nil){
        [self showPreviewOnly:_blog];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initBPMarkDownView{
    CGRect markdownRect = CGRectMake(0.f, 0.f, self.markdownContainerView.frame.size.width, self.markdownContainerView.frame.size.height);
    _markdownPreviewView = [[BPMarkdownView alloc] initWithFrame:markdownRect];
    
    // Obtain some markdown
    
    // Supply the markdown view with markdown to render
    [_markdownPreviewView setMarkdown:_markdownText];
    _markdownPreviewView.hidden = YES;
    // Add the markdown view to a superview
    [[self markdownContainerView] addSubview:_markdownPreviewView];
}

-(void)initRFMarkDownView{
    CGRect markdownRect = CGRectMake(0.f, 0.f, self.markdownContainerView.frame.size.width, self.markdownContainerView.frame.size.height);
    _markdownEditorView = [[RFMarkdownTextView alloc] initWithFrame:markdownRect];
    
    // Supply the markdown view with markdown to render
    //[markdownEditorView setText:markdownText];
    
    // Add the markdown view to a superview
    [[self markdownContainerView] addSubview:_markdownEditorView];
}
- (IBAction)preview:(id)sender {
    if(_markdownPreviewView.hidden){
        _markdownText = _markdownEditorView.text;
        [_markdownPreviewView setMarkdown:_markdownText];
        _markdownPreviewView.hidden = NO;
        _markdownEditorView.hidden = YES;
        [_markdownPreviewView layoutSubviews];
        [self.btnPreview setTitle:NSLocalizedString(@"Write", nil) forState:UIControlStateNormal];
    }else{
        _markdownPreviewView.hidden = YES;
        _markdownEditorView.hidden = NO;
        [self.btnPreview setTitle:NSLocalizedString(@"Preview", nil) forState:UIControlStateNormal];
    }
}

- (void)showPreviewOnly:(Blog*)blog{
    _blog = blog;
    _markdownText = blog.content;
    
    [_markdownPreviewView setMarkdown:_markdownText];
    _markdownPreviewView.hidden = NO;
    _markdownEditorView.hidden = YES;
    self.btnPreview.hidden = YES;
    [_markdownPreviewView layoutSubviews];
}
@end
