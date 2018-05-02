//
//  ProductDescriptionView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/19/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ProductDescriptionView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupConstraintForDescriptionView()
    }
    
    func configure(for product: Product) {
        productNameLabel.text = product.name
        productNameLabel.sizeToFit()
        
        productDescriptionLabel.text = product.description
        productDescriptionLabel.sizeToFit()
        
        productPriceLabel.text = product.price
        
        //ratingView.setRating(text: "\(product.averageRating)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let productNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        return label
    }()
    
    let productDescriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 8
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    let productPriceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "$100"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        
        return label
    }()
    
    let productRatingView : ProductRatingView = {
        let ratingView = ProductRatingView()
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        
        return ratingView
    }()
    
    func setupConstraintForDescriptionView()  {
        addSubview(productNameLabel)
        addSubview(productDescriptionLabel)
        addSubview(productPriceLabel)
        addSubview(productRatingView)
        
        let views = ["v1" : productNameLabel,
                     "v2" : productDescriptionLabel,
                     "v3" : productPriceLabel,
                     "v4" : productRatingView]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v1]-20-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v2]-20-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v3]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v4]-20-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v1(60)]-15-[v2]-15-[v3]-10-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v1(60)]-15-[v2]-15-[v4]-10-|", options: [], metrics: nil, views: views))
    }
}
