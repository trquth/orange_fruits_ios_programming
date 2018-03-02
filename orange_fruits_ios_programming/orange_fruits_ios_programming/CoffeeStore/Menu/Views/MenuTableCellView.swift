//
//  MenuTableCellView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/10/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class MenuTableCellView: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let menuBackground : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Coffee"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont(name: OpenSansSemibold, size: 25)
        label.textColor = whiteColor
        label.textAlignment = .center
        
        #if DEBUG
            label.text =  "Coffee"
        #endif
        
        return label
    }()
    
    lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont(name: OpenSansLightItalic, size: 13)
        label.textColor = whiteColor
        label.textAlignment = .center
        
        #if DEBUG
            label.text =  "Freshly brewed coffe"
        #endif
        
        return label
    }()
    
    
    func setupViews(){
        addSubview(menuBackground)
        menuBackground.addSubview(titleLabel)
        menuBackground.addSubview(descriptionLabel)
        
        let views = ["v1" : menuBackground,
                     "v2" : titleLabel,
                     "v3": descriptionLabel]  as [String : Any]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        menuBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v2]|", options: [], metrics: nil, views: views))
        menuBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v3]|", options: [], metrics: nil, views: views))
        menuBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2]-5-[v3]", options: [], metrics: nil, views: views))
        
        menuBackground.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: menuBackground, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
