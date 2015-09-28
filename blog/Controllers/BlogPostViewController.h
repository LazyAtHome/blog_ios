//
//  SecondViewController.h
//  blog
//
//  Created by peter on 15/9/9.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "Blog.h"

@interface BlogPostViewController : BaseViewController

- (IBAction)preview:(id)sender;

- (IBAction)post:(id)sender;

- (void)setBlog:(Blog*)blog;

@end

