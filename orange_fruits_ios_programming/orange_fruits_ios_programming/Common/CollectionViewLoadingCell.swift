//
//  CollectionViewLoadingCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/26/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CollectionViewLoadingCell: UICollectionViewCell {
    let identifier = "LoadingCell"
    
    let activitySpinner = UIActivityIndicatorView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         addActivitySpinner()
    }
    
    
    private
    
    func addActivitySpinner() {
        activitySpinner.color = UIColor.primary
        
        activitySpinner.startAnimating()
        
        contentView.addSubview(activitySpinner)
        
        activitySpinner.translatesAutoresizingMaskIntoConstraints = false
        
        activitySpinner.widthAnchor.constraint(equalToConstant: 24).isActive = true
        activitySpinner.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        activitySpinner.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerXAnchor).isActive = true
        activitySpinner.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
    }
}
