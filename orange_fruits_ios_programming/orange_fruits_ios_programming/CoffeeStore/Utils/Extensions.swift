//
//  Extensions.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/10/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

extension UIViewController {
    
    open  func setupNavigationBarItem(){
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : grayColor,
                                                                   NSAttributedStringKey.font : UIFont (name: OpenSansSemibold , size: 20)]
        
        self.addLeftBarButtonWithImage(UIImage(named: "Menu icon")!)
    }
    
    open func setStatusBarColor(_ barStyle : UIBarStyle){
        navigationController?.navigationBar.barStyle = (barStyle  == .default) ? UIBarStyle.default : UIBarStyle.blackTranslucent
    }
}
