//
//  CarouseModel.swift
//  SimpleCarouselDemo
//
//  Created by 也许、 on 16/10/20.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class CarouselModel: NSObject {
    
    var pic_url : String = ""
    
    init(dict:[String : Any]) {
        super.init()
        self.setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }

}
