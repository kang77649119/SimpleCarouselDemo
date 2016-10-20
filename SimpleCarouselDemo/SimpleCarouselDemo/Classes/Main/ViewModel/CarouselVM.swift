//
//  CarouseVM.swift
//  SimpleCarouselDemo
//
//  Created by 也许、 on 16/10/20.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class CarouselVM: NSObject {
    
    var carouselArray:[CarouselModel]?
    
    func loadData(finishedCallBack:@escaping ()->()) {
        
        let parameters:[String : Any] = ["version" : "2.300"]
        
        NetWorkTools.requestData(type: .POST, url: "http://www.douyutv.com/api/v1/slide/6", parameters: parameters) { (response) in
            
            guard let json = response else {
                finishedCallBack()
                return
            }
            
            guard let dataArray:[[String : Any]] = json["data"] as? [[String : Any]] else {
                finishedCallBack()
                return
            }
            
            self.carouselArray = [CarouselModel]()
            
            for obj in dataArray {
                self.carouselArray!.append(CarouselModel(dict: obj))
            }
            
            finishedCallBack()
        }
        
    }

}
