//
//  UIButton+Extensions.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/26/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

extension UIButton {
    func setBackgroundColor(color : UIColor, forState : UIControlState) {
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
        
    }
}
