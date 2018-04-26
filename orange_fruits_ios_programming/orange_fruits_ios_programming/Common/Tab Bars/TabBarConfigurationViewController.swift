//
//  TabBarConfigurationViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class TabBarConfigurationViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeViewController()
        homeVC.title = "Home"
        let nav = NavigationConfigurationController(rootViewController: homeVC)
        nav.tabBarItem.image = UIImage(named: "Home")
        nav.tabBarItem.title = "Home"
        self.addChildViewController(nav)
        
        let cartVC = UIViewController()
        cartVC.title = "Card"
        let nav2 = NavigationConfigurationController(rootViewController: cartVC)
        nav2.tabBarItem.image = UIImage(named: "Card")
        nav2.tabBarItem.title = "Card"
        self.addChildViewController(nav2)
        
    
        customTabBar()
    }
    
    
    func customTabBar(){
        let tabBar = TabBar()
        self.setValue(tabBar, forKey: "tabBar")
        self.selectedIndex = 0
    }

}
