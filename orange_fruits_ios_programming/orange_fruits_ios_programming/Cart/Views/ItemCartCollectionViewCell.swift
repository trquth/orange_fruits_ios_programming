//
//  ItemCartCollectionViewCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 5/17/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ItemCartCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
    }
    
    let thumbnailImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let productNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let qtyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let qtyValueLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let totalPrice : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let increaseButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(#imageLiteral(resourceName: "Increment"), for: .normal)
        
        return button
    }()
    
    let descreaseButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(#imageLiteral(resourceName: "Decrement"), for: .normal)
        
        return button
    }()
    
    func setUpViews() {
        addSubview(thumbnailImage)
        addSubview(productNameLabel)
        addSubview(qtyLabel)
        addSubview(increaseButton)
        addSubview(qtyValueLabel)
        addSubview(descreaseButton)
        addSubview(totalPrice)
        
        let views = ["v1": thumbnailImage,
                     "v2": productNameLabel,
                     "v3": qtyLabel,
                     "v4": increaseButton,
                     "v5":qtyValueLabel,
                     "v6": descreaseButton,
                     "v7": totalPrice]
    }
}
