//
//  BlogPreviewViewController.m
//  Blog
//
//  Created by peter on 15/9/22.
//  Copyright © 2015年 lazyathome. All rights reserved.
//

#import "BlogPreviewViewController.h"
#import "BPMarkdownView.h"

@interface BlogPreviewViewController (){
    BPMarkdownView          *_markdownPreviewView;
    NSString                *_markdownText;
    NSString                *_title;
    Blog                    *_blog;
}
@property (weak, nonatomic) IBOutlet UIView *markdownContainerView;
@property (weak, nonatomic) IBOutlet UIButton *btnPreview;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end

@implementation BlogPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(_markdownText == nil){
        _markdownText = @"";
    }
    [self.labelTitle setText:_title];
    [self initPreviewMarkDownView];
}


-(void)initPreviewMarkDownView{
    CGRect markdownRect = CGRectMake(0.f, 0.f, self.markdownContainerView.frame.size.width, self.markdownContainerView.frame.size.height);
    _markdownPreviewView = [[BPMarkdownView alloc] initWithFrame:markdownRect];
    
    // Obtain some markdown
    
    // Supply the markdown view with markdown to render
    [_markdownPreviewView setMarkdown:_markdownText];
    _markdownPreviewView.hidden = YES;
    // Add the markdown view to a superview
    [[self markdownContainerView] addSubview:_markdownPreviewView];
}

-(void)setBlog:(Blog *)blog{
    if(blog == nil){
        return;
    }
    _title = blog.title;
    _markdownText = blog.content;
}

- (void)setPreview:(NSString*)title content:(NSString*)content{
    _title = title;
    _markdownText = content;
}
@end
