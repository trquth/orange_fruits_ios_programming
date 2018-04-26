//
//  NavigationConfigurationController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class NavigationConfigurationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        customizeNavBar()
    }
    
    func setUp(){
        let bar = self.navigationBar
        
    }
    
    func customizeNavBar() {
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor.primary
        
        let backButtonImage = UIImage(named: "Back")
        
        UINavigationBar.appearance().backIndicatorImage = backButtonImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}
