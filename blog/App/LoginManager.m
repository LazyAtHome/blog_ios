//
//  LoginManager.m
//  Blog
//
//  Created by peter on 15/9/21.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#import "LoginManager.h"
@interface LoginManager () {
    User*       _user;
    NSString*   _accessToken;
}
@end

@implementation LoginManager

-(void)loginSucceed:(User*)user{
    _user = user;
    if(_user != nil){
        _accessToken = _user.accessToken;
    }else{
        _accessToken = nil;
    }
}

-(void)logout{
    _accessToken = nil;
}

-(Boolean)isLogined{
    return _accessToken != nil;
}

-(NSString*)getAcessToken{
    return _accessToken;
}
@end
