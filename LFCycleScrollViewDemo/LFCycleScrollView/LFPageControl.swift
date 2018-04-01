//
//  LFPageControl.swift
//  LFCycleScrollViewDemo
//
//  Created by zhangxc on 2018/4/1.
//  Copyright © 2018年 fantasee. All rights reserved.
//

import UIKit

private let LFPageControlPointWidth: CGFloat = 7
private let LFPageControlPointHeight: CGFloat = 20

class LFPageControl: UIPageControl {
    ///对外暴露的属性
    var currentImage : UIImage?   //焦点图片
    var defaultImage : UIImage?   //默认图片
    var pointSpace : CGFloat = 15
    var pageSize : CGSize {
        get {
            if let curImage = currentImage, let defImage = defaultImage {
                let pageH = curImage.size.height
                let defDotW = defImage.size.width
                let curDotW = curImage.size.width
                let pageW = CGFloat(numberOfPages - 1) * (pointSpace + defDotW + defDotW) + curDotW
                return CGSize(width: pageW, height: pageH)
            }
            else {
                let pageW = CGFloat(numberOfPages - 1) * (pointSpace + LFPageControlPointWidth) + LFPageControlPointWidth
                return CGSize(width: pageW, height: LFPageControlPointHeight)
            }
        }
    }
    
    override var currentPage: Int{
        didSet {
            updatePageControl()
        }
    }
    
    init(frame: CGRect, currentImage: UIImage?, defaultImage:UIImage?) {
        super.init(frame:frame)
        self.currentImage = currentImage
        self.defaultImage = defaultImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LFPageControl {
    func updatePageControl(){
        for index in 0..<subviews.count{
            let newSize = getDotSize(currentIndex: index)
            let dot = subviews[index]
            dot.frame = CGRect(x: dot.frame.origin.x, y: dot.frame.origin.y, width: newSize.width, height: newSize.height)
            if dot.subviews.count == 0 {
                let imgView = UIImageView(frame: dot.bounds)
                imgView.contentMode = .scaleAspectFit
                dot.addSubview(imgView)
            }
            
            let imgView = dot.subviews.first as! UIImageView
            imgView.frame = dot.bounds
            
            if index == currentPage
            {
                if let curImage = currentImage {
                    imgView.image = curImage
                    dot.backgroundColor = .clear
                } else {
                    imgView.image = nil
                    dot.backgroundColor = currentPageIndicatorTintColor
                }
            }
            else if let defImage = defaultImage {
                imgView.image = defImage
                dot.backgroundColor = .clear
            }
            else {
                imgView.image = nil
                dot.backgroundColor = pageIndicatorTintColor
            }
        }
    }
    
    func getDotSize(currentIndex:Int) -> CGSize {
        var newSize = CGSize(width: 0, height: 0)
        if let curImage = currentImage, let defImage = defaultImage {
            if currentIndex == currentPage {
                newSize = curImage.size
            } else {
                newSize = defImage.size
            }
        } else {
            newSize = CGSize(width: LFPageControlPointWidth, height: LFPageControlPointWidth)
        }
        return newSize
    }
}
