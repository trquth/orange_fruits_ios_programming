//
//  WindowController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/17/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class WindowController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "UIKit - Window - Swift"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Hidden", style: .done, target: self, action: nil)
        
        let normalItem = UIBarButtonItem(title: "Normal", style: .done, target: self, action: nil)
        normalItem.tag = 1
        let alertItem = UIBarButtonItem(title: "Alert", style: .done, target: self, action: nil)
        alertItem.tag = 2
        let statusItem = UIBarButtonItem(title: "Status", style: .done, target: self, action: nil)
        statusItem.tag = 3
        self.navigationItem.rightBarButtonItems = [normalItem, alertItem, statusItem]
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        self.edgesForExtendedLayout = []
    }
}
