//
//  CustomCodePathTabbarViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 6/18/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CustomCodePathTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTabbar()
    }
    
    func setupCustomTabbar() {
        let passingDataVC = ViewController()
        passingDataVC.navigationItem.title = "Passing Data"
        let firstTab = UINavigationController(rootViewController: passingDataVC)
        firstTab.title = "1st"
        firstTab.tabBarItem.image = UIImage(named: "Bank")
        
        
        let formInputVC = FormViewController()
        formInputVC.navigationItem.title = "Form Input In Row Table"
        let secondTab = UINavigationController(rootViewController: formInputVC)
        secondTab.title = "2st"
        secondTab.tabBarItem.image = UIImage(named : "Card")
        
        
        viewControllers = [firstTab,secondTab]
        tabBar.isTranslucent = false
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor(red: 229, green: 231, blue: 235, alpha: 1).cgColor
        
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    

}
