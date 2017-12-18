//
//  WindowController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/17/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class WindowController: UIViewController {
    
    var normalWindow: UIWindow!
    var alertWindow: UIWindow!
    var statusWindow: UIWindow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "UIKit - Window - Swift"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Hidden", style: .done, target: self, action: #selector(hiddenWindow))
        
        let normalItem = UIBarButtonItem(title: "Normal", style: .done, target: self, action: #selector(showWindow(sender:forEvent:)))
        normalItem.tag = 1
        let alertItem = UIBarButtonItem(title: "Alert", style: .done, target: self, action: #selector(showWindow(sender:forEvent:)))
        alertItem.tag = 2
        let statusItem = UIBarButtonItem(title: "Status", style: .done, target: self, action: #selector(showWindow(sender:forEvent:)))
        statusItem.tag = 3
        self.navigationItem.rightBarButtonItems = [normalItem, alertItem, statusItem]
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        self.edgesForExtendedLayout = []
    }
    
    @objc func showWindow(sender: UIBarButtonItem,forEvent event: UIEvent) {
        let index = sender.tag
        if index == 1 {
            normalClick()
        }else if index == 2 {
            alertClick()
        }else{
            statusClick()
        }
    }
    
    @objc func hiddenWindow(){
        if alertWindow != nil {
            alertWindow.resignKey()
            alertWindow.isHidden = true
        }
        
        if statusWindow != nil {
            statusWindow.resignKey()
            statusWindow.isHidden = true
        }
        
        if normalWindow != nil {
            normalWindow.resignKey()
            normalWindow.isHidden = true
        }
    }
    
    func alertClick()  {
        if alertWindow == nil {
            alertWindow = UIWindow(frame: .zero)
            alertWindow.windowLevel = UIWindowLevelAlert
            alertWindow.frame = CGRect(x: 10, y: UIScreen.main.bounds.midX , width: UIScreen.main.bounds.maxX  - 10 * 2, height: 250)
            alertWindow.backgroundColor = UIColor.lightGray
            
            alertWindow.layer.cornerRadius = 5
            //alertWindow.becomeKey()
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: alertWindow.frame.width  - 10 * 2, height: 180))
            label.backgroundColor = .orange
            label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 15)
            label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            label.textAlignment = .center
            label.numberOfLines = 0
            
            alertWindow.addSubview(label)
            
            _ = alertWindow.frame
            let alertBounds = alertWindow.bounds
            
            let hiddenButton = UIButton(frame: CGRect(x: alertBounds.width - 70 - 10, y: alertBounds.height - 20 - 30, width: 70, height: 30))
            hiddenButton.setTitle("Hidden", for: .normal)
            hiddenButton.setTitleColor(UIColor.white, for: .normal)
            hiddenButton.backgroundColor = UIColor.red
            
            hiddenButton.layer.borderWidth = 1
            hiddenButton.layer.masksToBounds = true
            hiddenButton.layer.cornerRadius = 3
            
            hiddenButton.addTarget(self, action: #selector(hiddenWindow), for: .touchUpInside)
            
            alertWindow.addSubview(hiddenButton)
        }
        
        alertWindow.makeKeyAndVisible()
    }
    
    func normalClick() {
        if normalWindow == nil {
             normalWindow = UIWindow(frame: .zero)
            let sizeBounds = UIScreen.main.bounds
            normalWindow.frame = CGRect(x: 60, y: 70, width: sizeBounds.width - 60 * 2, height: sizeBounds.height - 60 * 2)
            normalWindow.windowLevel = UIWindowLevelNormal
            normalWindow.becomeKey()
        }
        
        normalWindow.backgroundColor = UIColor(red: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), alpha: 1)
        
        
        normalWindow.makeKeyAndVisible()
        normalWindow.isHidden = false
    }
    
    func statusClick() {
        if statusWindow == nil {
            let mainScreenBounds = UIScreen.main.bounds
            statusWindow = UIWindow(frame: CGRect(x: 10, y: 60, width: mainScreenBounds.size.width - 10 * 2, height: mainScreenBounds.size.height - 60 * 2))
            statusWindow.windowLevel = UIWindowLevelStatusBar
            statusWindow.backgroundColor = .orange
        }
        statusWindow.makeKeyAndVisible()
    }
    
}
