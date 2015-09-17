//
//  LoginViewController.m
//  Blog
//
//  Created by peter on 15/9/10.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "LoginViewController.h"
#import "UIViewController+HUD.h"
#import "UserService.h"

@interface LoginViewController () {
    
    IBOutlet UITextField* _textAccount;
    
    IBOutlet UITextField* _textPassword;
}

@end
@implementation LoginViewController

- (IBAction)login:(id)sender {
    [self showHud];
    [[UserService sharedUserService] login:_textAccount.text password:_textPassword.text delegate:self];
}

- (void)onSucceed:(NSDictionary*)response tag:(int)tag {
    [self hideHud];
    NSLog(@"JSON: %@", response);
}

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg tag:(int)tag {
    [self hideHud];
    NSLog(@"Error: %d, %@", status, errorMsg);
}

@end
