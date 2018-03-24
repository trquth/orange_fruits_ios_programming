//
//  ProductCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/21/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    var downloadTask: URLSessionDownloadTask?
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var ratingView: ProductRatingView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.addBorder(.bottom, color: UIColor.lightGray, thickness: 0.4)
        self.layer.addBorder(.right, color: UIColor.lightGray, thickness: 0.4)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        downloadTask?.cancel()
        downloadTask = nil
        
        nameLabel.text = nil
        priceLabel.text = nil
        thumbImageView.image = nil
    }
    
    func configure(forProduct product: Product) {
        self.nameLabel.text = product.name
        self.priceLabel.text = product.price
        
        self.ratingView.setRating(text: "\(product.averageRating)")
        
        if let imageURL = product.thumbnailURL, imageURL != "null", let url = URL(string: imageURL) {
            downloadTask = self.thumbImageView.loadImageWithURL(url)
        } else {
            self.thumbImageView.image = UIImage(named: "Product")
        }
    }
}
