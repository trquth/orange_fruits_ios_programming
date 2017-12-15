//
//  NormalViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 12/15/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class NormalViewController: UIViewController, UIScrollViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 218/255, green: 223/255, blue: 232/255, alpha: 1)

        navigationController?.navigationBar.isTranslucent = true
        
        self.title = "Normal ScrollView"
        
        setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let mainScrollView : UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.autoresizingMask = .flexibleHeight
        
        scrollView.isScrollEnabled = true
        scrollView.scrollsToTop = true
        scrollView.bounces = true
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.indicatorStyle = .white
        
        return scrollView
    }()
    
    func addRowsIntoScrollView() {
        view.addSubview(mainScrollView)
//        mainScrollView.frame = CGRect(x: 10, y: 10, width: view.bounds.width - 10 * 2, height: view.bounds.height)
        mainScrollView.frame = view.bounds
        
        var originY : CGFloat = 10.0
        
        for number in 1...10{
            let label = UILabel(frame: CGRect(x: 10, y: originY, width: mainScrollView.bounds.width - 10 * 2, height: 200))
            mainScrollView.addSubview(label)
            label.backgroundColor = UIColor(red: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), alpha: 1)
            label.textAlignment = .center
            label.text = "Row \(number)"
            
            originY = originY + label.bounds.height + 10
        }
        
        mainScrollView.contentSize = CGSize(width: view.bounds.width - 20, height: originY)
        
        mainScrollView.delegate = self
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = .orange
        
        label.text = "HEADER LABEL"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 15)
        
        label.isHidden = false
        
        return label
    }()
    
    let footerLabel: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = .green
        
        label.text = "FOOTER LABEL"
        label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 15)
        label.textAlignment = .center
        label.textColor = .white
        
        label.autoresizingMask = .flexibleTopMargin
        
        return label
    }()
    
    func setupView()  {
        addRowsIntoScrollView()
        
        view.addSubview(headerLabel)
        headerLabel.frame = CGRect(x: 0, y:0, width: view.frame.width, height: 0)
        view.addSubview(footerLabel)
        footerLabel.frame = CGRect(x: 0, y: view.frame.height - 40, width: view.frame.width, height: 0)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("1 scrollViewWillBeginDragging")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("2 scrollViewDidScroll")
        
        let offsetY = scrollView.contentOffset.y
        print("offsetY = \(offsetY)")
        
        let offsetYMax = scrollView.contentSize.height
        print("offsetYMax = \(offsetYMax)")
        let offsetYTmp = offsetYMax - view.bounds.height
        print("offsetYTmp = \(offsetYTmp)")
        
        if offsetY <= 0{
            var rectHeader = headerLabel.frame
            rectHeader.size.height = offsetY * -1
            headerLabel.frame = rectHeader
            
            if offsetY <= -100 {
                scrollView.contentInset = UIEdgeInsetsMake(80 ,0 ,0 , 0)
            }
        }else{
            let offsetYUp = offsetY - offsetYTmp
            
            var rectFooter = footerLabel.frame
//            rectFooter.origin
        }
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
    }
}
