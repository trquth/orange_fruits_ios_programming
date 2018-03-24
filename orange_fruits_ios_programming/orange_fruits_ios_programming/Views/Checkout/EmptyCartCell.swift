//
//  EmptyCartCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class EmptyCartCell: UITableViewCell {
    let identifier = "EmptyCartCell"
    
    let label = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(style: .default, reuseIdentifier: identifier)
        
        addLabel()
    }
    
    private
    
    func addLabel() {
        label.text = "Your cart is empty"
        label.textColor = UIColor.black
        label.textAlignment = .center
        
        label.font = UIFont(name: "Helvetica Bold", size: 15)
        
        label.sizeToFit()
        
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
    }
}

