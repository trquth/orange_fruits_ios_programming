//
//  CustomMainTabbarViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 7/28/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//
//
import UIKit
import ESTabBarController_swift

class CustomMainTabBarViewController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarController = ESTabBarController()
        if let tabBar = tabBarController.tabBar as? ESTabBar {
            tabBar.itemCustomPositioning = .fillIncludeSeparator
        }
        let v1 = ViewController()
        let v2 = ViewController()
        let v3 = ViewController()
        let v4 = ViewController()
        let v5 = ViewController()
        
        v1.tabBarItem = ESTabBarItem.init(BackgroundTabBarContentView(), title: nil, image: UIImage(named: "locationnormalicon"), selectedImage: UIImage(named: "locationhighlighticon"))
        
        v2.tabBarItem = ESTabBarItem.init(BackgroundTabBarContentView(), title: nil, image: UIImage(named: "restaurantnormalicon"), selectedImage: UIImage(named: "restauranthighlighticon"))
        
        v3.tabBarItem = ESTabBarItem.init(BackgroundTabBarContentView.init(specialWithAutoImplies: true), title: nil, image: UIImage(named: "homeicon"), selectedImage: UIImage(named: "homeicon"))
        
        v4.tabBarItem = ESTabBarItem.init(BackgroundTabBarContentView(), title: nil, image: UIImage(named: "newsnormalicon"), selectedImage: UIImage(named: "newshighlighticon"))
        
        v5.tabBarItem = ESTabBarItem.init(BackgroundTabBarContentView(), title: nil, image: UIImage(named: "favournormalicon"), selectedImage: UIImage(named: "favourhighlighticon"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

