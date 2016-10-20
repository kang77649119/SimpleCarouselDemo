//
//  ViewController.swift
//  SimpleCarouselDemo
//
//  Created by 也许、 on 16/10/19.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

let screenW = UIScreen.main.bounds.width
let carouselViewH : CGFloat = 150

class ViewController: UIViewController {

    // 轮播视图
    lazy var carouselView : CarouselView = {
        
        let carouseView:CarouselView = CarouselView.initView()
        carouseView.frame = CGRect(x: 0, y: 20, width: screenW, height: carouselViewH)
        return carouseView
    
    }()
    
    // ViewModel
    lazy var carouselVM:CarouselVM = CarouselVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.初始化UI
        setupUI()
        
        // 2.加载数据
        loadData()
        
    }

}

extension ViewController {

    // 初始化UI
    func setupUI() {
        self.view.addSubview(carouselView)
    }
    
    // 加载数据
    func loadData() {
    
        carouselVM.loadData {
            self.carouselView.carouseArray = self.carouselVM.carouselArray
        }
    
    }

}

