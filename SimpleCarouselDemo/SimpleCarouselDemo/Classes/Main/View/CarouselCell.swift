//
//  CarouselCell.swift
//  SimpleCarouselDemo
//
//  Created by 也许、 on 16/10/20.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit
import SDWebImage

class CarouselCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!

    var carouselModel : CarouselModel? {
    
        didSet {
            let url = URL(string: carouselModel!.pic_url)
            self.img.sd_setImage(with: url)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
