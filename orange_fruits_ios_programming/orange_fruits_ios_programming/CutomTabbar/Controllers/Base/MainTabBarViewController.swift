//
//  MainTabBarViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 6/20/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        self.tabBar.isHidden = true
        setupViews()
        
    }
    
    
    let mainTabbarView : MainTabBarView = {
        let view = MainTabBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    func setupViews()  {
        view.backgroundColor = .white
        self.view.addSubview(mainTabbarView)
        
        let views = ["v1" : mainTabbarView]
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1(80)]|", options: [], metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
