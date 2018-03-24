//
//  ProductDetailsView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/22/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ProductDetailsView: UIView {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingView: ProductRatingView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        setup()
    }
    
    func configure(for product: Product) {
        nameLabel.text = product.name
        nameLabel.sizeToFit()
        
        descriptionLabel.text = product.description
        descriptionLabel.sizeToFit()
        
        priceLabel.text = product.price
        
        ratingView.setRating(text: "\(product.averageRating)")
    }
    
    private
    
    func setup() {
        nameLabel.numberOfLines = 2
        nameLabel.lineBreakMode = .byWordWrapping
        
        descriptionLabel.numberOfLines = 5
        descriptionLabel.lineBreakMode = .byWordWrapping
    }
}
