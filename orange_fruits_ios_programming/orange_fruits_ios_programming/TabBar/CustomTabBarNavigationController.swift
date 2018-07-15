//
//  TabNavigationController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 7/14/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class  CustomTabBarNavigationController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let firstScreen = UIViewController()
        firstScreen.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "locationnormalicon"), selectedImage: UIImage(named : "locationhighlighticon"))
        let firstTab = UINavigationController(rootViewController: firstScreen)
        
        let secondScreen = UIViewController()
        secondScreen.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "restaurantnormalicon"), selectedImage: UIImage(named : "restauranthighlighticon"))
        let secondTab = UINavigationController(rootViewController: secondScreen)
        
        let thirdScreen = UIViewController()
        thirdScreen.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "newsnormalicon"), selectedImage: UIImage(named : "newshighlighticon"))
        let thirdTab = UINavigationController(rootViewController: thirdScreen)
        
        let fourthScreen = UIViewController()
        fourthScreen.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "favournormalicon"), selectedImage: UIImage(named : "favourhighlighticon"))
        let fourthTab = UINavigationController(rootViewController: fourthScreen)
        
        self.viewControllers = [firstTab, secondTab, thirdTab,fourthTab]
        
        setupMiddleButton()
    }
    
    func setupMiddleButton()  {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        
        menuButton.backgroundColor = UIColor.red
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        view.addSubview(menuButton)
        
        menuButton.setImage(UIImage(named: "homeicon"), for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
        
        view.layoutIfNeeded()
    }
    
    @objc private func menuButtonAction(sender: UIButton) {
        selectedIndex = 2
    }
}
