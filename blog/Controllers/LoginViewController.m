//
//  LoginViewController.m
//  Blog
//
//  Created by peter on 15/9/10.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "LoginViewController.h"
#import "UIViewController+HUD.h"
#import "WCAlertView.h"
#import "UserService.h"
#import "LDJValidator.h"
#import "Const.h"
#import "Response.h"
#import "User.h"
#import "LoginManager.h"

@interface LoginViewController () {
    
    IBOutlet UITextField* _textAccount;
    
    IBOutlet UITextField* _textPassword;
    __weak IBOutlet UIView *viewLogined;
    
    __weak IBOutlet UIView *viewLogin;
    __weak IBOutlet UILabel *labelUserName;
}

@end
@implementation LoginViewController

- (IBAction)login:(id)sender {
    LDJValidator* validator = [[LDJValidator alloc]init];
    if(![validator isValidUserName:_textAccount.text]){
        [self showHudWithTitle:NSLocalizedString(@"User Name Check Error(6-20 length)", nil)];
        return;
    }
    if(![validator isValidUserName:_textPassword.text]){
        [self showHudWithTitle:NSLocalizedString(@"Password Check Error(6-20 length)", nil)];
        return;
    }
    [self showHud];
    [[UserService singleton] login:_textAccount.text password:_textPassword.text delegate:self];
}

- (IBAction)logout:(id)sender {
    [self showHud];
    [[UserService singleton] logout:self];
}

- (void)onSucceed:(NSDictionary*)response tag:(int)tag {
    [self hideHud];
    NSLog(@"JSON: %@", response);
    if(tag == TAG_NETQUERY_LOGIN){
        Response* loginResponse = [[Response alloc]initWithDictionary:response];
        if([loginResponse isSucceed]){
           viewLogin.hidden = YES;
           [self showAlert:NSLocalizedString(@"Login Succeed", nil)];
            User* user = [[User alloc]initWithDictionary:loginResponse.data];
            [labelUserName setText:user.userName];
            [[LoginManager singleton] loginSucceed:user];
        }else{
            [self showAlert:loginResponse.responseMsg];
        }
    }
    else if(tag == TAG_NETQUERY_LOGOUT){
        [[LoginManager singleton]logout];
        Response* loginResponse = [[Response alloc]initWithDictionary:response];
        if([loginResponse isSucceed]){
            viewLogin.hidden = NO;
            [self showAlert:NSLocalizedString(@"Logouted", nil)];
        }else{
            [self showAlert:loginResponse.responseMsg];
        }
    }
}

- (void)onFailed:(int)status errorMsg:(NSString*)errorMsg tag:(int)tag {
    [self hideHud];
    [self showAlert:errorMsg];
    NSLog(@"Error: %d, %@", status, errorMsg);
}

@end
