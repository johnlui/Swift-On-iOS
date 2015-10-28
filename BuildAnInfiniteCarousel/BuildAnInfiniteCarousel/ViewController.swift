//
//  ViewController.swift
//  BuildAnInfiniteCarousel
//
//  Created by 吕文翰 on 15/10/29.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = UIScreen.mainScreen().bounds.width
        let height = width/2
        
        for i in 0...5 {
            let iv = UIImageView(frame: CGRectMake(width * CGFloat(i), 0, width, height))
            var picName = "pic"
            switch i {
            case 0:
                picName += "4"
            case 5:
                picName += "1"
            default:
                picName += i.description
            }
            iv.image = UIImage(named: picName)
            iv.contentMode = UIViewContentMode.ScaleAspectFill
            iv.clipsToBounds = true
            iv.userInteractionEnabled = true
            self.scrollView.addSubview(iv)
        }
        self.scrollView.contentSize = CGSizeMake(width * 6, height)
        self.scrollView.contentOffset = CGPointMake(width, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let width = UIScreen.mainScreen().bounds.width
            let offsetX = scrollView.contentOffset.x
            
            if offsetX == 0 {
                scrollView.contentOffset = CGPointMake(width * CGFloat(4), 0)
            }
            if offsetX == width * CGFloat(4 + 1) {
                scrollView.contentOffset = CGPointMake(width, 0)
            }
            
            // 此处不能用 offsetX 代替 scrollView.contentOffset.x，这个值在变化
            let currentPage = scrollView.contentOffset.x / width - 0.5
            self.pageControl.currentPage = Int(currentPage)
        }
    }

}

