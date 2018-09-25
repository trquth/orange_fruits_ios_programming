//
//  MainTabBarController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 9/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController , MainTabBarDelegate{
    
  

    private var mainTabBarView : MainTabBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstScreen = FirstViewController()
        let secondScreen = SecondViewController()
        let fourthScreen = FourthViewController()
        
         self.viewControllers = [firstScreen,secondScreen,fourthScreen]
        
        self.selectedIndex = 1
        
        mainTabBarView = MainTabBarView(frame: self.tabBar.frame)
        mainTabBarView.delegate = self
        self.view.addSubview(mainTabBarView)
    }
    
    func didChooseItem(itemIndex: Int) {
        self.selectedIndex = itemIndex
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
