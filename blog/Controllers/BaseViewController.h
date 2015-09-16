//
//  BaseViewController.h
//  LAZY
//
//  Created by peter on 15-3-4.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseViewController : UIViewController
{
}
//去掉多余得cell
-(void)setExtraCellLineHidden: (UITableView *)tableView;
-(void)addAction:(UIView*)cell action:(SEL)action;
@end
