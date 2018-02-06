//
//  OldPriceLabel.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/4/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class OldPriceLabel : UILabel{
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setLineWidth(1)
        ctx?.move(to: CGPoint(x: 0, y:  rect.size.height / 2))
        ctx?.addLine(to:CGPoint(x: rect.size.width, y: rect.size.height / 2 ))
        ctx?.strokePath()
    }
}
