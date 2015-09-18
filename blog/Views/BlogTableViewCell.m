//
//  BlogTableViewCell.m
//  Blog
//
//  Created by peter on 15/9/11.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "BlogTableViewCell.h"

@interface BlogTableViewCell (){
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

@end
