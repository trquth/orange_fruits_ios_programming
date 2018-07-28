//
//  TabNavigationController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 7/14/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class  MainTabBarController: UITabBarController {
    
    var tarbarConfigArr : [Dictionary<String, String>]!
    var mainTabBarView :MainTabBarView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        self.tarbarConfigArr = self.getConfigArrFromPlistFile()
        self.createControllers()
        self.createMainTabBarView()
        
    }
    
    private  func  getConfigArrFromPlistFile() ->([Dictionary<String,String>]?){
        let  filePath: String? = Bundle.main.path(forResource: "TabBarConfig", ofType: "plist")
        let plistData = NSDictionary(contentsOfFile: filePath ?? "")
        let configArr = plistData?.object(forKey: "Tabbars") as? [Dictionary<String,String>]
        return configArr;
    }
    
    private func createControllers(){
        var controllerNameArray = [String]()
        var controllerTitle = [String]()
        for dictionary in self.tarbarConfigArr{
            controllerNameArray.append(dictionary["ClassName"]!);
            controllerTitle.append(dictionary["Title"]!)
            
            guard controllerNameArray.count > 0 else{
                return
            }
            var nvcArray = [BaseNavigationViewController]()
            let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            for i in 0...controllerNameArray.count-1 {
                let anyClass: AnyClass? = NSClassFromString(clsName + "." + controllerNameArray[i])
                if let vcClassType = anyClass as? BaseViewController.Type {
                    let viewcontroller = vcClassType.init()
                    viewcontroller.title = controllerTitle[i]
                    let nav = BaseNavigationViewController(rootViewController:viewcontroller)
                    nvcArray.append(nav)
                }
            }
            self.viewControllers = nvcArray
        }
    }
    
    private func createMainTabBarView(){
        let tabBarRect = self.tabBar.frame;
        self.tabBar.isHidden = true;
        mainTabBarView = MainTabBarView(frame: tabBarRect,tabbarConfigArr:tarbarConfigArr!);
       // mainTabBarView.delegate = self
        self.view.addSubview(mainTabBarView)
    }
    
    func didChooseItem(itemIndex: Int) {
        self.selectedIndex = itemIndex
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    
}
