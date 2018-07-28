//
//  BaseContentView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 7/28/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class BaseContentView: ESTabBarItemContentView {
    
    override init(frame : CGRect){
        super.init(frame : frame)
        textColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        iconColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

