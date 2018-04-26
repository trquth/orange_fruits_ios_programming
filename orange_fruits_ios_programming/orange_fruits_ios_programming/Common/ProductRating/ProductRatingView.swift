//
//  RatingView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/13/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ProductRatingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let starImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "RatingStarUnfilled"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        return imageView
    }()
    
    let numberStarLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "0.0"
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    let ratingButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(red: 77/255, green: 177/255, blue: 104/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    func setupViews() {
        addSubview(ratingButton)
        ratingButton.addSubview(starImageView)
        ratingButton.addSubview(numberStarLabel)
        
        let views = ["v1": ratingButton, "v2": starImageView, "v3": numberStarLabel]
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1(65)]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(35)]|", options: [], metrics: nil, views: views))
        ratingButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v2(20)]", options: [], metrics:nil, views: views))
        ratingButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v3]-5-|", options: [], metrics:nil, views: views))
        ratingButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2(20)]", options: [], metrics:nil , views: views))
        ratingButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v3]|", options: [], metrics: nil , views: views))
        
        starImageView.centerYAnchor.constraint(equalTo: ratingButton.centerYAnchor).isActive = true
       
    }
}
