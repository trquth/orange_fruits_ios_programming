//
//  HomeCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/3/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    var fillData : ProductModel? {
        didSet {
            if let icon = fillData?.iconName {
                iconImage.image = UIImage(named: icon)
            }
            if let title = fillData?.title {
                titleLabel.text = title
            }
            if let desc = fillData?.desc {
                descLabel.text = desc
            }
            
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    var iconImage : UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        icon.layer.cornerRadius = 40
        icon.layer.masksToBounds = true
        
        //icon.contentMode = .scaleToFill
        
        return icon
    }()
    
    var titleLabel : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
     var descLabel : UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.numberOfLines = 2
        
        return desc
    }()
    
    var addCartButton : UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = UIColor(red: 234/255, green: 42/255, blue: 63/255, alpha: 1)
        button.setTitle("ADD", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    func setupViews()  {
        addSubview(iconImage)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(addCartButton)
        
        let views = ["v0": iconImage,
                     "v1": titleLabel,
                     "v2": descLabel,
                     "v3": addCartButton] as [String : Any]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(80)]", options: [], metrics: [:], views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(80)]", options: [], metrics: [:], views: views))
        let iconCenterX = NSLayoutConstraint(item: iconImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        addConstraints([iconCenterX])
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v1(20)]-10-[v2]|", options: [], metrics: [:], views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0(80)]-10-[v1]-[v3(70)]-10-|", options: [], metrics: [:], views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0(80)]-10-[v2]-[v3(70)]-10-|", options: [], metrics: [:], views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v3(35)]", options: [], metrics: [:], views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v3(70)]", options: [], metrics: [:], views: views))
        addConstraint(NSLayoutConstraint(item: addCartButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
