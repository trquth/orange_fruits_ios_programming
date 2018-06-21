//
//  MainTabBarItem.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 6/20/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class MainTabBarItem: UIControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
    }
    
    let imageView : UIImageView = {
        let image = UIImageView(image: UIImage(named :"tabbarTwo_selected"))
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let titleLbl : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Home"
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    func setupViews(){
        self.backgroundColor = .yellow
        
        self.addSubview(imageView)
        self.addSubview(titleLbl)
        
        let views = ["v1": imageView,
                     "v2" : titleLbl]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(40)]-5-[v2]|", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v1(40)]", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v2(==v1)]", options: [], metrics: nil, views: views))
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
}
