//
//  RegisterViewModel.swift
//  Blog
//
//  Created by peter on 15/10/8.
//  Copyright © 2015年 lazyathome. All rights reserved.
//

import Foundation

class RegisterViewModel: SceneModel {
    var _request : RegisterRequest?
    override func loadSceneModel() {
        super.loadSceneModel()
        
        _request = RegisterRequest.RequestWithBlock({
            self.SEND_IQ_ACTION(self._request)
        }) as! RegisterRequest
        
        self._request!.rac_valuesForKeyPath("state",observer:self).filter( {
            (state : AnyObject!) -> Bool in
                var ret = false
                ret = (self._request?.succeed())!
                return ret
        }).subscribeNext({
            (state : AnyObject!) -> Void in
                self._request!.output
        })
        self.SEND_ACTION(self._request)
    }
}