//
//  Config.swift
//  Blog
//
//  Created by peter on 15/10/12.
//  Copyright © 2015年 lazyathome. All rights reserved.
//

import Foundation

extension NSString {
    
}
func +(left: NSString, right: NSString) -> NSString {
    return NSString(format: "%@%@",left,right)
}

@objc class Config : NSObject {
    static let HTTP_HOST : NSString = "jason.tunnel.mobi";
    static let HTTP_PREFIX : NSString = "http://" + HTTP_HOST + "/blogserver"
    static let HTTP_BLOG_PREFIX : NSString  = HTTP_PREFIX
    static let  URL_REGISTER : NSString     = HTTP_PREFIX + "/users/reg"
    static let  URL_LOGIN : NSString        = HTTP_PREFIX + "/users/login"
    static let  URL_LOGOUT : NSString       = HTTP_PREFIX + "/users/logout"
    static let  URL_CURRENT : NSString      = HTTP_PREFIX + "/users/current"
    
    static let  URL_BLOG_GETBYID: NSString  = HTTP_PREFIX + "/posts"
    static let  URL_BLOG_GETALL: NSString   = HTTP_PREFIX + "/posts/all"
    static let  URL_BLOG_POST: NSString     = HTTP_PREFIX + "/posts"
    static let  URL_BLOG_UPDATE: NSString   = HTTP_PREFIX + "/posts"
    static let  URL_BLOG_DELETE: NSString   = HTTP_PREFIX + "/posts"
    
    static let  URL_BLOG_COMMENT: NSString   = HTTP_PREFIX + "/postComments"
    
    static let TAG_NETQUERY_COMMENT         = 21
}