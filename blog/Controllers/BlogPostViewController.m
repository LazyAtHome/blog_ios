//
//  SecondViewController.m
//  blog
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogPostViewController.h"
#import "BPMarkdownView.h"

@interface BlogPostViewController ()

@end

@implementation BlogPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initMarkDownView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initMarkDownView{
    CGRect markdownRect = CGRectMake(0.f, 0.f, 100.f, 100.f);
    BPMarkdownView *markdownView = [[BPMarkdownView alloc] initWithFrame:markdownRect];
    
    // Obtain some markdown
    NSString *markdown = @""
    "# Hello, world!"
    ""
    "This is my text body. There are many more like it, "
    "but this one is mine.";
    
    // Supply the markdown view with markdown to render
    [markdownView setMarkdown:markdown];
    
    // Add the markdown view to a superview
    [[self view] addSubview:markdownView];
}
@end
