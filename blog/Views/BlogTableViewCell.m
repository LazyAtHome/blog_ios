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
#import "BlogService.h"
#import "Response.h"
#import "Const.h"

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
    _blog = blog;
    [self.title setText:blog.title];
    [self.content setText:blog.content];
    if(blog.version != nil){
        [self.updateCount setText:[NSString stringWithFormat:@"%d",blog.version.intValue]];
    }
    if(blog.viewCount != nil){
        [self.readCount setText:[NSString stringWithFormat:@"%d",blog.version.intValue]];
    }
    if(blog.createBy != nil){
        [self.createBy setText:blog.createBy];
    }
    if(blog.createDate != nil){
        [self.createDate setText:blog.createDate];
    }
    self.btnUpdate.hidden = YES;
    self.btnDelete.hidden = YES;
    if([[LoginManager singleton] getLoginedUser] != nil){
        if([[[LoginManager singleton] getLoginedUser].id isEqualToNumber:blog.userId]){
            self.btnUpdate.hidden = NO;
            self.btnDelete.hidden = NO;

        }
    }
}

- (IBAction)edit:(id)sender {
    BlogPostViewController* postVC = [[BlogPostViewController alloc]init];
    if([[self.btnUpdate topMostController] isKindOfClass:[UINavigationController class]]){
        [postVC setBlog:_blog];
        [(UINavigationController*)[self.btnUpdate topMostController] pushViewController:postVC animated:YES];
    }
}

- (IBAction)delete:(id)sender{
    [[BlogService singleton]blogDelete:[NSString stringWithFormat:@"%d",_blog.id.intValue] delegate:self];
}

- (void)onSucceed:(NSDictionary*)response tag:(int)tag {
    NSLog(@"JSON: %@", response);
    Response* blogResponse = [[Response alloc]initWithDictionary:response];
    if([blogResponse isSucceed]){
        [[NSNotificationCenter defaultCenter] postNotificationName:KNotify_PostChanged object:nil];
    }else{
    }
}

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg tag:(int)tag {
    NSLog(@"Error: %d, %@", status, errorMsg);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    //内容（滚动视图）高度大于一定数值时
    if (textView.contentSize.height > 50)
    {
        //删除最后一行的第一个字符，以便减少一行。
        textView.text = [textView.text substringToIndex:[textView.text length]-1];
        return NO;
    }
    
    return YES;
}



@end
