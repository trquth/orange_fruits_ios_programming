//
//  MainViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 9/26/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let screenWidth = UIScreen.main.bounds.width
    
    private var mainView = UIView()
    private var middleView : UIView!
    private var rootViewController : UITabBarController!
    private var menuViewController : UIViewController!
    
    private var panGesture = UIPanGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMain()
        addPanGesture()
       
    }

    func initMain() {
        middleView = UIView(frame: self.view.frame)
        self.view.addSubview(middleView)
        
        rootViewController =  UITabBarController()
        
        let firstVC =  FirstViewController()
        firstVC.tabBarItem.image = UIImage(named:  "locationnormalicon")
        firstVC.tabBarItem.selectedImage = UIImage(named:  "locationhighlighticon")?.withRenderingMode(.alwaysOriginal)
        rootViewController.addChildViewController(NavigationController(rootViewController :firstVC ))
        
        let secondVC = SecondViewController()
        secondVC.tabBarItem.image = UIImage(named:  "favournormalicon")
        secondVC.tabBarItem.selectedImage = UIImage(named:  "favourhighlighticon")?.withRenderingMode(.alwaysOriginal)
        rootViewController.addChildViewController(NavigationController(rootViewController: secondVC) )
        
        let fourthVC = FourthViewController()
        fourthVC.tabBarItem.image = UIImage(named:  "newsnormalicon")
        fourthVC.tabBarItem.selectedImage = UIImage(named:  "newshighlighticon")?.withRenderingMode(.alwaysOriginal)
        rootViewController.addChildViewController(NavigationController(rootViewController: fourthVC) )
        
        rootViewController.tabBar.isTranslucent = false
        
        middleView.addSubview(rootViewController.view)
        
        menuViewController = UIViewController()
        menuViewController.view.frame.origin.x =  -screenWidth
        menuViewController.view.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(menuViewController.view)
        
        
    }
    
    func  addPanGesture() {
        panGesture.addTarget(self, action: #selector (self.panAction(_:)))
        middleView.addGestureRecognizer(panGesture)
    }

   @objc func panAction(_ recognizer : UIPanGestureRecognizer) {
        NSLog("X", recognizer.translation(in: self.view).x)
        let offsetX = recognizer.translation(in: self.view).x
    
        if offsetX >= 0 {
            menuViewController.view.frame.origin.x = -screenWidth + offsetX
        }
    
    if  recognizer.state == .ended {
        if offsetX > screenWidth * (0.64/2){
            
        }else{
            showHome()
        }
    }
    
    }
    
    func showLeft()  {
        
    }
    
    func showHome()  {
        UIView.animate(withDuration: 0.3, animations: {
            self.menuViewController.view.frame.origin.x = -self.screenWidth
        })
        
        mainView.removeFromSuperview()
    }
}
