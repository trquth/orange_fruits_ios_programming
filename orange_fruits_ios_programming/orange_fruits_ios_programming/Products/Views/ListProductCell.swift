//
//  ProductCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/3/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ListProductCell: UICollectionViewCell {
    
    var downloadTask: URLSessionDownloadTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        var borderBottom = CALayer()
        var borderTop = CALayer()
        //bottom
        borderBottom.frame = CGRect(x: 0 , y: self.frame.width - 1 , width: self.frame.width, height: 1)
         self.layer.addSublayer(borderBottom)
        //top
        borderTop.frame = CGRect(x: 0, y: 0, width: self.frame.width - 1, height: 1)
        borderTop.backgroundColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(borderTop)
       
        
        
    }
    
    let ratingProductView : ProductRatingView = {
        let ratingProduct = ProductRatingView()
        ratingProduct.translatesAutoresizingMaskIntoConstraints = false
        
        return ratingProduct
    }()
    
    let productNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Product1"
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    let productImageThumb : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    let productPriceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "$100"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    func configure(forProduct product: Product) {
        self.productNameLabel.text = product.name
        self.productPriceLabel.text = product.price
        
        // self.ratingProductView.setRating(text: "\(product.averageRating)")
        
        if let imageURL = product.thumbnailURL, imageURL != "null", let url = URL(string: imageURL) {
            downloadTask = self.productImageThumb.loadImageWithURL(url)
        } else {
            self.productImageThumb.image = UIImage(named: "Product")
        }
    }
    
    func setUpViews(){
        addSubview(productImageThumb)
        addSubview(productNameLabel)
        addSubview(productPriceLabel)
        addSubview(ratingProductView)
        
        let views = ["v1" : productImageThumb,
                     "v2" : productNameLabel,
                     "v3" : productPriceLabel,
                     "v4": ratingProductView]
        
        let widthImage = frame.width / 2
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v1(\(widthImage))]-10-[v2]-5-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v1(\(widthImage))]-10-[v3]-5-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v1(\(widthImage))]-10-[v4]", options: [], metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v3]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2][v4][v3]", options: [], metrics: nil, views: views))
        ratingProductView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
