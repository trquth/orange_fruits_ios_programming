//
//  TabBar.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class TabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        UITabBar.appearance().tintColor = UIColor.primary
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
