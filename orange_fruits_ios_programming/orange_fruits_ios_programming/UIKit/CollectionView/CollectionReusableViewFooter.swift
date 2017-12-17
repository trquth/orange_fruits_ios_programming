//
//  CollectionReusableViewFooter.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/17/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class CollectionReusableViewFooter: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let labelFooter : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        label.textAlignment = .center
        label.textColor = .white
        //label.backgroundColor = .black
        
        return label
    }()
    
    func setupView()  {
        self.addSubview(labelFooter)
        labelFooter.frame = CGRect(x: 10, y: 0, width: Int(self.bounds.width - 10 * 2), height: Int(heightFooter))
    }
}
