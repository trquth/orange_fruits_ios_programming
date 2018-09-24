//
//  MainTabBarController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 9/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    private var mainTabBarView : MainTabBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainTabBarView = MainTabBarView(frame: self.tabBar.frame)
        self.view.addSubview(mainTabBarView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
