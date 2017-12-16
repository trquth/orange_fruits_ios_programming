//
//  PageViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/16/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIScrollViewDelegate{
    var mainTimer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UIKit - ScrollView - Page"
        
        setupView()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        self.edgesForExtendedLayout = []
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addTimer()
    }
    
    func addTimer()  {
        mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(autoShow), userInfo: nil, repeats: true)
    }
    
    @objc func autoShow() {
        var page = mainPageControl.currentPage
        
        if page == 9 {
            page = 0
        }else{
            page = page + 1
        }
        
        let offsetX = CGFloat(page) * mainPageControl.frame.width
        mainScrollView.setContentOffset(CGPoint(x: offsetX ,y: 0), animated: true)
        mainPageControl.currentPage = page
        
    }
    
    func removerTimer(){
        if mainTimer != nil {
            mainTimer.invalidate()
            mainTimer = nil
        }
    }
    let mainScrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(red: 225/255, green: 230/255, blue: 239/255, alpha: 1)
        
        //scrollView.isScrollEnabled = true
        //scrollView.showsHorizontalScrollIndicator = true
        //scrollView.bounces = true
        //scrollView.isPagingEnabled = true
        scrollView.indicatorStyle = .black
        
       
        return scrollView
    }()
    
    let mainPageControl : UIPageControl = {
        let pageControl = UIPageControl()
        
        pageControl.backgroundColor = UIColor(red: 247 / 255, green: 169 / 255, blue: 66 / 255, alpha: 0.1)
        
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor =  UIColor(red: 84 / 255, green: 66 / 255, blue: 247 / 255, alpha: 1)
        
        return pageControl
    }()
    
    func addPageIntoScrollView()  {
        view.addSubview(mainScrollView)
        mainScrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
        mainScrollView.contentSize = CGSize(width: view.bounds.width, height: 200)
        
        var originX: CGFloat = 0
        for number in 1...10 {
            let label = UILabel()
            label.frame = CGRect(x: originX, y: 0, width: view.bounds.width, height: 200)
            label.text = "Add Label Into ScrollView - 😍 🎩 - \(number)"
            label.textAlignment = .center
            label.backgroundColor = UIColor(red: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)),
                blue: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), alpha: 1)
            
            mainScrollView.addSubview(label)
            
            originX = label.frame.minX + label.frame.width
        }
        
        mainScrollView.contentSize = CGSize(width: originX, height: mainScrollView.bounds.height)
        
        view.addSubview(mainPageControl)
        mainPageControl.frame = CGRect(x: (view.bounds.width - 200) / 2, y: mainScrollView.bounds.height - 10 - 20 , width: 200, height: 20)
        
        mainScrollView.delegate = self
        
    }
    
    func setupView() {
        addPageIntoScrollView()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("1 scrollViewWillBeginDragging")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("2 scrollViewDidScroll")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("3 scrollViewWillEndDragging")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("4 scrollViewDidEndDragging")
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("5 scrollViewWillBeginDecelerating")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("6 scrollViewDidEndDecelerating")
        
        let width = scrollView.bounds.width
        let offsetX = scrollView.contentOffset.x
        
        let index = offsetX / width
        
        mainPageControl.currentPage = Int(index)
    }
}
