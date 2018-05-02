//
//  BaseViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/28/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController{
    
    override func viewDidLoad() {
        refreshCartItemBadgeCount()
    }
    
    func refreshCartItemBadgeCount(){
        if let order = Order.currentOrder{
            if let controller = self.tabBarController{
                if let tabBarItems = controller.tabBar.items{
                    tabBarItems[1].badgeValue = "\(order.itemsCount)"
                }
            }
        }
    }
}
