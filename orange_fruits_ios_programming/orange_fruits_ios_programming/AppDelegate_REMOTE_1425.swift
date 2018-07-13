    //
//  AppDelegate.swift
//  orange_fruits_ios_programming.
//
//  Created by Thien Tran on 12/13/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit
    

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainTabBarVC:MainTabBarViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        self.mainTabBarVC = MainTabBarViewController();
        self.window?.rootViewController = self.mainTabBarVC;
        
        application.statusBarStyle = .lightContent
        customizeAppearance()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func customizeAppearance() {
        customizeStatusBar()
    }
    
    func customizeStatusBar() {
        
        let statusBarView = UIView()
        statusBarView.backgroundColor = UIColor.primary
        statusBarView.translatesAutoresizingMaskIntoConstraints = false
        
        window?.addSubview(statusBarView)
       
        let view = ["v1": statusBarView]
        
        window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: view))
         window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(20)]", options: [], metrics: nil, views: view))
    }
    
    

}

