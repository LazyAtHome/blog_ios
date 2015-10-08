//
//  RegisterRequest.swift
//  Blog
//
//  Created by peter on 15/10/8.
//  Copyright © 2015年 lazyathome. All rights reserved.
//

import Foundation

class RegisterRequest : Request {
    override func loadRequest() {
        super.loadRequest()
        self.PATH = "/feeds";
        self.METHOD = "GET";
        self.httpHeaderFields = NSDictionary(objects:[LoginManager.singleton().getAcessToken()], forKeys:["accessToken"]) as [NSObject : AnyObject]
    }

}
