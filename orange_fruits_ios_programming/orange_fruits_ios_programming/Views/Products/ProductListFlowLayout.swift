//
//  ProductListFlowLayout.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/21/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ProductListFlowLayout: UICollectionViewFlowLayout {
    
    var itemWidth: CGFloat {
        return collectionView!.frame.width
    }
    
    var itemHeight: CGFloat {
        return 150
    }
    
    override init() {
        super.init()
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupLayout()
    }
    
    func setupLayout() {
        scrollDirection = .vertical
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsetsMake(44, 0, 0, 0)
    }
    
    override var itemSize: CGSize {
        get {
            return CGSize(width: itemWidth, height: itemHeight)
        }
        set {
            self.itemSize = CGSize(width: itemWidth, height: itemHeight)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}

