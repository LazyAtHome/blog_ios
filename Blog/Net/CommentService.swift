//
//  CommentService.swift
//  Blog
//
//  Created by peter on 15/10/12.
//  Copyright © 2015年 lazyathome. All rights reserved.
//

import Foundation

@objc class CommentService: NSObject {
    func comment(content: NSString?, postId:Int, delegate:NetQueryDelegate) {
    
        let netQuery : NetQuery = NetQuery.init();
        netQuery.delegate = delegate;
        let dic : NSMutableDictionary  = NSMutableDictionary();
        if (content != nil) {
            dic.setObject(content!, forKey: "content")
        }
        dic.setObject(postId, forKey: "postId")
        netQuery.httpPost( Config.URL_BLOG_COMMENT as String, params: dic as [NSObject : AnyObject], tag: Int32(Config.TAG_NETQUERY_COMMENT));
    }
    
    func commentUpdate(content: NSString?, postId:CLong, commentId: CLong,delegate:NetQueryDelegate) {
        
        let netQuery : NetQuery = NetQuery.init();
        netQuery.delegate = delegate;
        let dic : NSMutableDictionary  = NSMutableDictionary();
        if (content != nil) {
            dic.setObject(content!, forKey: "content")
        }
        dic.setObject(postId, forKey: "postId")
        //dic.setObject(commentId, forKey: "id")
        let url : NSString = NSString(format: "%@/%d", Config.URL_BLOG_COMMENT,commentId)
        netQuery.httpPut(url as String, params: dic as [NSObject : AnyObject], tag: Int32(Config.TAG_NETQUERY_COMMENT));
    }
    
    func commentDelete(commentId :Int,delegate:NetQueryDelegate) {
        let netQuery : NetQuery = NetQuery.init();
        netQuery.delegate = delegate;
        let dic : NSMutableDictionary  = NSMutableDictionary();
        let url : NSString = NSString(format: "%@/%d", Config.URL_BLOG_COMMENT,commentId)
        netQuery.httpDelete( url as String, params: dic as [NSObject : AnyObject], tag: Int32(Config.TAG_NETQUERY_COMMENT));
    }

}
