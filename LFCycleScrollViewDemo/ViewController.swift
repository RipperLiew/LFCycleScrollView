//
//  ViewController.swift
//  LFCycleScrollViewDemo
//
//  Created by zhangxc on 2018/4/1.
//  Copyright © 2018年 fantasee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cycleScrollView: LFCycleScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     view.backgroundColor = .white
        let height:CGFloat = 200
        let frame = CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: height)
        let localImages = ["localImg6","localImg7","localImg8","localImg9","localImg10"]
        let descs = ["韩国防部回应停止部署萨德:遵照最高统帅指导方针",
                     "勒索病毒攻击再次爆发 国内校园网大面积感染",
                     "Win10秋季更新重磅功能：跟安卓与iOS无缝连接",
                     "《琅琊榜2》为何没有胡歌？胡歌：我看过剧本，离开是种保护",
                     "阿米尔汗在印度的影响力，我国的哪位影视明星能与之齐名呢？"]
        cycleScrollView = LFCycleScrollView(frame:frame, type:.LOCAL, imgs:localImages, descs:descs)
        cycleScrollView!.delegate = self
        cycleScrollView?.descLabelFont = UIFont.boldSystemFont(ofSize: 15)
        cycleScrollView?.descLabelHeight = 50
        cycleScrollView?.pageControlAliment = .RightBottom
        view.addSubview(cycleScrollView!)    }

}

extension ViewController : LFCycleScrollViewDelegate {
    /// 点击图片回调
    func cycleScrollViewDidSelect(at index:Int, cycleScrollView:LFCycleScrollView)
    {
        print("点击了第\(index+1)个图片")
    }
    /// 图片滚动回调
    func cycleScrollViewDidScroll(to index:Int, cycleScrollView:LFCycleScrollView)
    {
        print("滚动到了第\(index+1)个图片")
    }
}

