//
//  BlogTableViewCell.m
//  Blog
//
//  Created by peter on 15/9/11.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogTableViewCell.h"
#import "BlogPostViewController.h"
#import "LoginManager.h"
#import <IQKeyboardManager/IQUIView+Hierarchy.h>

@interface BlogTableViewCell (){
    Blog* _blog;
}

@end

@implementation BlogTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.title setText:NSLocalizedString(@"Title", nil) ];
    [self.content setText:NSLocalizedString(@"Summery", nil)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)fill:(Blog*)blog{
    if(blog == nil){
        return;
    }
    [self.title setText:blog.title];
    [self.content setText:blog.content];
    if(blog.version != nil){
        [self.updateCount setText:[NSString stringWithFormat:@"%d",blog.version.intValue]];
    }
    if(blog.viewCount != nil){
        [self.readCount setText:[NSString stringWithFormat:@"%d",blog.version.intValue]];
    }
    self.btnUpdate.hidden = YES;
    if([[LoginManager singleton] getLoginedUser] != nil){
        if([[[LoginManager singleton] getLoginedUser].id isEqualToNumber:blog.id]){
            self.btnUpdate.hidden = NO;
        }
    }
}

- (IBAction)edit:(id)sender {
    BlogPostViewController* postVC = [[BlogPostViewController alloc]init];
    [[self.btnUpdate topMostController].navigationController pushViewController:postVC animated:YES];
}

@end
