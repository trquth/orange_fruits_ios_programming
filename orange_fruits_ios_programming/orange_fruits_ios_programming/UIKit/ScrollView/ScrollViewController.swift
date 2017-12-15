//
//  ScrollViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 12/15/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class  ScrollViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.title = "SCROLLVIEW"
        
        let normalItem  = UIBarButtonItem(title: "Normal", style: .done, target: self, action: nil)
        normalItem.target = 1 as AnyObject
        let pageItem = UIBarButtonItem(title: "Page", style: .done, target: self, action: nil)
        pageItem.target = 2 as AnyObject
        let imageItem = UIBarButtonItem(title: "Image", style: .done, target: self, action: nil)
        imageItem.target = 3 as AnyObject
        self.navigationItem.rightBarButtonItems = [normalItem, pageItem, imageItem]
    }
}
