//
//  NetWorkTools.swift
//  SimpleCarouselDemo
//
//  Created by 也许、 on 16/10/19.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit
import AFNetworking

enum RequestType {

    case GET
    case POST
    
}

class NetWorkTools: NSObject {

    class func requestData(type:RequestType, url : String, parameters : [String : Any]?, finishedCallBack:@escaping ([String : Any]?)->()) {
        
        if type == .GET {
            AFHTTPSessionManager().get(url, parameters: parameters, progress: nil, success: { (_, response) in
                
                guard let data = response as? [String : Any] else {
                    finishedCallBack(nil)
                    return
                }
                
                finishedCallBack(data)
                
                }, failure: { (_, error) in
                    print("请求失败")
            })
        }
        
        if type == .POST {
            AFHTTPSessionManager().post(url, parameters: parameters, progress: nil, success: { (_, response) in
                
                guard let data = response as? [String : Any] else {
                    finishedCallBack(nil)
                    return
                }
                
                finishedCallBack(data)
                
                }, failure: { (_, error) in
                    print("请求失败")
            })
        }
        
        
    
    }
    
}
