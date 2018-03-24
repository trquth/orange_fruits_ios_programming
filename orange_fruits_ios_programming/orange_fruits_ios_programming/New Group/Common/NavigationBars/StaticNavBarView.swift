//
//  StaticNavBarView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class StaticNavBarView: UIView {
    
    var navBar: UIView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure() {
        addNavBar()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.frame = CGRect(x: 0, y: 20, width: superview!.bounds.width, height: 44)
        
        navBar?.frame = CGRect(x: 0, y: 0, width: superview!.bounds.width, height: 44)
    }
    
    private
    
    func addNavBar() {
        if let navBar = navBar {
            addSubview(navBar)
        }
    }
}

