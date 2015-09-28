//
//  BlogPreviewViewController.h
//  Blog
//
//  Created by peter on 15/9/22.
//  Copyright © 2015年 lazyathome. All rights reserved.
//

#import "BaseViewController.h"
#import "Blog.h"

@interface BlogPreviewViewController : BaseViewController

- (void)setBlog:(Blog*)blog;
- (void)setPreview:(NSString*)title content:(NSString*)content;

@end
