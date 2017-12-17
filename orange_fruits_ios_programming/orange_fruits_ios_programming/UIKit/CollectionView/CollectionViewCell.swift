//
//  CollectionViewCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/16/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var data: Int? {
        didSet{
            if let index = data {
                label.text = "Label at \(index)"
            }
            
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewCell()
        
    }
    
    let label : UILabel = {
        let label = UILabel()
        let widthPr = widthCell
        let heightPr = heightCell
        let calculateWidth = widthCell - 5 * 2
        let calculateHeight = (heightCell - 5) * 2
        label.frame = CGRect(x: 5, y: 5, width: Int(widthCell - 5 * 2) , height: (Int(heightCell - 5 * 2)))
        label.numberOfLines = 0
        label.font = UIFont(name: "AppleSDGothicNeo-Medium ", size: 14)
        label.textColor = .gray
        label.textAlignment = .center
        
        label.backgroundColor = UIColor(red: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(arc4random()) / CGFloat(RAND_MAX)), alpha: 1)
        
        return label
    }()
    func setupViewCell(){
        contentView.addSubview(label)
        contentView.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
