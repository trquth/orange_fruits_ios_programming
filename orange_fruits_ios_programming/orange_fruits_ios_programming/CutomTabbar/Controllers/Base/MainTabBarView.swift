//
//  MainTabBarView.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 6/20/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class MainTabBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
         self.backgroundColor = UIColor.blue
        setupViews()
    }
    
    let mainTabbarItem : MainTabBarItem = {
        let item = MainTabBarItem()
        item.translatesAutoresizingMaskIntoConstraints = false
        
        item.backgroundColor = .yellow
        return item
    }()
    
    let mainTabbarItem2 : MainTabBarItem = {
        let item = MainTabBarItem()
        item.translatesAutoresizingMaskIntoConstraints = false
        
        item.backgroundColor = .orange
        return item
    }()
    
    func setupViews() {
        self.addSubview(mainTabbarItem)
        self.addSubview(mainTabbarItem2)
        
        let views = ["v1" : mainTabbarItem,
                     "v2" : mainTabbarItem2];
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1]|", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2]|", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1(70)][v2(70)]|", options: [], metrics: nil, views: views))
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
