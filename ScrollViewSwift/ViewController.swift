//
//  ViewController.swift
//  ScrollViewSwift
//
//  Created by ruchin somal on 19/01/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var moveImage:CGFloat = 0
    var moveImage1:CGFloat = 0
    var moveImage2:CGFloat = 0
    var imgOne = UIImageView()
    var imgTwo = UIImageView()
    var imgThree = UIImageView()
    var imgFour = UIImageView()
    var imgFive = UIImageView()
    var imgSix = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate=self;
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        imgOne = UIImageView(frame: CGRectMake(0, 0,scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "mobile-1")
        imgOne.backgroundColor=UIColor(red: 231/255.0, green: 151/255.0, blue: 56/255.0, alpha: 1.0)
        imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0,scrollViewWidth, scrollViewHeight))
        imgTwo.backgroundColor=UIColor(red: 241/255.0, green: 92/255.0, blue: 86/255.0, alpha: 1.0)
        imgTwo.image = UIImage(named: "mobile_2")
        imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0,scrollViewWidth, scrollViewHeight))
        imgThree.backgroundColor=UIColor(red: 173/255.0, green: 97/255.0, blue: 169/255.0, alpha: 1.0)
        imgThree.image = UIImage(named: "mobile_3")
        
        imgFour = UIImageView(frame: CGRectMake(-scrollViewWidth*2, 0,scrollViewWidth, scrollViewHeight))
        imgFour.image = UIImage(named: "bg-3")
        imgFive = UIImageView(frame: CGRectMake(-scrollViewWidth, 0,scrollViewWidth, scrollViewHeight))
        imgFive.image = UIImage(named: "bg-2")
        imgSix = UIImageView(frame: CGRectMake(0, 0,scrollViewWidth, scrollViewHeight))
        imgSix.image = UIImage(named: "bg-1")
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        self.scrollView.addSubview(imgFive)
        self.scrollView.addSubview(imgSix)
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 3,self.scrollView.frame.height)
        self.pageControl.currentPage = 0
        moveImage = imgSix.center.x
        moveImage1 = imgFive.center.x
        moveImage2 = imgFour.center.x
        //print(imgSix.bounds.origin.x)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage)
        //print("count:\(Int(currentPage))")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollOffset:CGFloat = scrollView.contentOffset.x * 2
        imgSix.center.x = scrollOffset + moveImage
        imgFive.center.x = scrollOffset + moveImage1
        imgFour.center.x = scrollOffset + moveImage2
        //imgSix.center.x = moveImage + imgSix.center.x
        //print(scrollView.contentOffset.x)
        
    }

}

