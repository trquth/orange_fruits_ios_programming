//
//  ProductGridFlowLayout.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/9/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ProductGridFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        setupLayout()
    }
    
    var itemWidth : CGFloat {
        return collectionView!.frame.width / 2 - 5
    }
    
    var itemHeight : CGFloat {
        return itemWidth + 60
    }
    
    func setupLayout(){
        scrollDirection = .vertical
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    override var itemSize: CGSize {
        get {
            return CGSize(width: itemWidth, height: itemHeight)
        }
        set {
            self.itemSize = CGSize(width: itemWidth, height: itemHeight)
        }
    }
    
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
//        return (collectionView?.contentOffset)!
//    }
}
