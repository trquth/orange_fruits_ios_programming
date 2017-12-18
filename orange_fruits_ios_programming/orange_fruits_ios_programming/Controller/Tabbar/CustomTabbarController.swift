//
//  CustomTabbarController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 12/18/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController {
    override func viewDidLoad() {
        let firstVC = TabViewController()
        firstVC.title = "FIRST VIEW"
        firstVC.view.backgroundColor = .orange
        firstVC.tabBarItem = UITabBarItem(title: "1st", image: nil, tag: 1)
        
        let secondVC = TabViewController()
        secondVC.title = "SECOND VIEW"
        secondVC.view.backgroundColor = .blue
        secondVC.tabBarItem = UITabBarItem(title: "2nd", image: nil, tag: 2)
        
        let thirdVC = TabViewController()
        thirdVC.title = "THIRD VIEW"
        thirdVC.view.backgroundColor = .red
        thirdVC.tabBarItem = UITabBarItem(title: "3rd", image: nil, tag: 3)
        
        tabBar.barTintColor = UIColor.lightGray
        
        selectedIndex = 2
        
        viewControllers = [firstVC, secondVC, thirdVC]
        
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: .normal)
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.blue], for: .selected)
        
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font : UIFont(name: "AppleSDGothicNeo-Regular", size: 25)], for: .normal)        

    }
}
