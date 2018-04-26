//
//  BaseCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/2/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    var url : String? {
        didSet {
            if let url = URL(string: url!) {
                baseImageView.loadImageWithURL(url)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    
    var baseImageView : UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    func setUpViews()  {
        addSubview(baseImageView)
        
        baseImageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
