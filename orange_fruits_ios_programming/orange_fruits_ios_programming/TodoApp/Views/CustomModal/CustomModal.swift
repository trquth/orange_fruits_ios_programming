//
//  CustomModal.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/25/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CustomModal :UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .black
        view.alpha = 0.5
        
        return view
    }()
    
    let title : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Hello, there!! 🇻🇳"
        title.textAlignment = .center
        
        return title
    }()
    
    let separatorLineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = UIColor.groupTableViewBackground
        return view
    }()
    
    let dialogView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.isOpaque = false
        view.backgroundColor = .white
        view.alpha = 1
        view.layer.cornerRadius = 4
        
        return view
    }()
    
    let imageView : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "dos-1-1"))
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        
        return image
    }()
    
    func setupViews()  {
        addSubview(backgroundView)
        addSubview(dialogView)
        dialogView.addSubview(title)
        dialogView.addSubview(separatorLineView)
        dialogView.addSubview(imageView)
        
        let views = ["v1" : backgroundView,
                     "v2": dialogView,
                     "v3": title,
                     "v4":  separatorLineView,
                     "v5": imageView]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v2(400)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2(350)]", options: [], metrics: nil, views: views))
        
        let centerX = NSLayoutConstraint(item: dialogView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: dialogView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        addConstraints([centerX, centerY])
        
        dialogView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v3]|", options: [], metrics: nil, views: views))
        dialogView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v4]|", options: [], metrics: nil, views: views))
        dialogView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v5]-5-|", options: [], metrics: nil, views: views))
        dialogView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v3(20)]-5-[v4(2)]-5-[v5(300)]-5-|", options: [], metrics: nil, views: views))
        
    }
    
}
