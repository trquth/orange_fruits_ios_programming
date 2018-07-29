//
//  UIColor.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 7/29/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red : Int, green : Int , blue : Int, alpha: Float) {
        self.init(red :CGFloat(red) / 255, green :  CGFloat(green) / 255,blue : CGFloat(blue) / 255,alpha  : CGFloat(alpha))
    }
}
