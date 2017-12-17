//
//  CollectionReusableViewHeader.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/17/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class CollectionReusableViewHeader: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let labelHeader : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        label.textAlignment = .center
        label.textColor = .white
        //label.backgroundColor = .green
        
        return label
    }()
    
    func setupView() {
        self.addSubview(labelHeader)
        let mySelf = self.bounds
        labelHeader.frame = CGRect(x: 10.0, y: 0.0, width: self.bounds.width - 10.0 * 2, height: CGFloat(heightHeader))
    }
}
