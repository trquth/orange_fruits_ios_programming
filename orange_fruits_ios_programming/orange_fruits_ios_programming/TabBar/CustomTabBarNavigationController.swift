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
        
        self.tabBar.backgroundColor = .white
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let firstScreen = UIViewController()
        firstScreen.tabBarItem.tag = 1
        firstScreen.tabBarItem.image = UIImage(named: "locationnormalicon")?.withRenderingMode(.alwaysOriginal)
        firstScreen.tabBarItem.selectedImage = UIImage(named: "locationhighlighticon")?.withRenderingMode(.alwaysOriginal)
        

        let firstTab = UINavigationController(rootViewController: firstScreen)
        
        let secondScreen = UIViewController()
        secondScreen.tabBarItem.tag = 2
        secondScreen.tabBarItem.image = UIImage(named: "restaurantnormalicon")?.withRenderingMode(.alwaysOriginal)
        secondScreen.tabBarItem.selectedImage = UIImage(named: "restauranthighlighticon")?.withRenderingMode(.alwaysOriginal)

        let secondTab = UINavigationController(rootViewController: secondScreen)
        
        let thirdScreen = UIViewController()
        thirdScreen.tabBarItem.tag = 4
        thirdScreen.tabBarItem.image = UIImage(named: "newsnormalicon")?.withRenderingMode(.alwaysOriginal)
        thirdScreen.tabBarItem.selectedImage = UIImage(named: "newshighlighticon")?.withRenderingMode(.alwaysOriginal)

        let thirdTab = UINavigationController(rootViewController: thirdScreen)
        
        let fourthScreen = UIViewController()
        fourthScreen.tabBarItem.tag = 5 
        fourthScreen.tabBarItem.image = UIImage(named: "favournormalicon")?.withRenderingMode(.alwaysOriginal)
        fourthScreen.tabBarItem.selectedImage = UIImage(named: "favourhighlighticon")?.withRenderingMode(.alwaysOriginal)
        
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
        
        menuButton.backgroundColor = UIColor(red: 49/255, green: 136/255, blue: 250/255, alpha: 1)
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
