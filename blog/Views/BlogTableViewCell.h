//
//  BlogTableViewCell.h
//  Blog
//
//  Created by peter on 15/9/11.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Blog.h"

@interface BlogTableViewCell : UITableViewCell

@property IBOutlet UILabel* title;
@property IBOutlet UITextView* content;


@property IBOutlet UILabel* updateCount;
@property IBOutlet UILabel* readCount;
@property IBOutlet UIButton* btnUpdate;

-(void)fill:(Blog*)blog;
- (IBAction)edit:(id)sender;

@end
