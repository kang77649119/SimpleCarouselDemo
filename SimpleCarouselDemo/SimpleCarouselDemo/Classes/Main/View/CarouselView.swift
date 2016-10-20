//
//  CarouselView.swift
//  SimpleCarouselDemo
//
//  Created by 也许、 on 16/10/19.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

private let carouselCellId = "carouselCellId"

class CarouselView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var timer : Timer?
    
    var carouseArray:[CarouselModel]? {
    
        didSet {
            
            self.pageControl.numberOfPages = carouseArray!.count
            self.pageControl.isHidden = carouseArray!.count <= 0
            self.collectionView.reloadData()
            
            stopTimer()
            startTimer()
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = self.collectionView.bounds.size
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: "CarouselCell", bundle: nil), forCellWithReuseIdentifier: carouselCellId)
        collectionView.delegate = self
        
    }

}

extension CarouselView {

    func startTimer() {
        
        timer = Timer(timeInterval: 3, target: self, selector: #selector(self.autoScroll), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
        
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func autoScroll() {
        let offset = CGPoint(x: self.collectionView.contentOffset.x + self.collectionView.bounds.width, y: 0)
        self.collectionView.setContentOffset(offset, animated: true)
    }


}

extension CarouselView : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let count = self.carouseArray?.count else {
            return 0
        }
        
        return count * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: carouselCellId, for: indexPath) as! CarouselCell
        
        let index = indexPath.item % self.carouseArray!.count
        cell.carouselModel = self.carouseArray![index]
        
        return cell
        
    }
    
}

extension CarouselView : UICollectionViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        let page = index % self.carouseArray!.count
        self.pageControl.currentPage = page
    
    }

}

extension CarouselView {

    class func initView() -> CarouselView {
        return Bundle.main.loadNibNamed("CarouselView", owner: nil, options: nil)?.first as! CarouselView
    }

}


