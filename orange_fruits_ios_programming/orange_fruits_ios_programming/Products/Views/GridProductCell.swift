//
//  GridProductCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/9/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class GridProductCell : UICollectionViewCell {
    
    var downloadTask: URLSessionDownloadTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let rightBorder = CALayer()
        rightBorder.backgroundColor = UIColor.lightGray.cgColor
        rightBorder.frame = CGRect(x: self.frame.width - 1, y: 0 , width: 1, height: self.frame.height)
        self.layer.addSublayer(rightBorder)

        let bottomBorder = CALayer()
        bottomBorder.backgroundColor = UIColor.lightGray.cgColor
        bottomBorder.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        self.layer.addSublayer(bottomBorder)
    }
    
    let productImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let productNameLbl : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Grid product"
        
        return label
    }()
    
    let productPriceLbl : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "$100"
        
        return label
    }()
    
    let ratingProductView : ProductRatingView = {
        let ratingProduct = ProductRatingView()
        ratingProduct.translatesAutoresizingMaskIntoConstraints = false
        
        return ratingProduct
    }()
    
    func configure(forProduct product: Product) {
        self.productNameLbl.text = product.name
        self.productPriceLbl.text = product.price
        
       // self.ratingProductView.setRating(text: "\(product.averageRating)")
        
        if let imageURL = product.thumbnailURL, imageURL != "null", let url = URL(string: imageURL) {
            downloadTask = self.productImageView.loadImageWithURL(url)
        } else {
            self.productImageView.image = UIImage(named: "Product")
        }
    }
    
    func setupViews()  {
        addSubview(productImageView)
        addSubview(productNameLbl)
        addSubview(productPriceLbl)
        addSubview(ratingProductView)
        
        let views = ["v1" : productImageView,
                     "v2": productNameLbl,
                     "v3" : productPriceLbl,
                     "v4" : ratingProductView]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v2]|", options: [], metrics: nil, views: views))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v3]", options: [], metrics: nil, views: views))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v4]-5-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v1][v2][v3]-5-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v1][v2][v4]-5-|", options: [], metrics: nil, views: views))
        
    }
}
