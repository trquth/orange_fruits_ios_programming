//
//  PromoOfferCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/26/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class PromoOfferCell: UICollectionViewCell {
    
    var imageURLs = [String]()
    
    var mainScrollView : UIScrollView!
    var promoImageView : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.mainScrollView =  UIScrollView(frame: CGRect(x : 0.0,y: 0.0,width: self.bounds.width, height : self.bounds.height))
        
        self.addSubview(self.mainScrollView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageCount: Int {
        return imageURLs.count
    }
    func prepareTilesData() -> [String] {
        var tiles = [String]()
        
        tiles.append(imageURLs[imageCount - 2])
        tiles.append(imageURLs[imageCount - 1])
        
        for tile in imageURLs {
            tiles.append(tile)
        }
        
        tiles.append(imageURLs[0])
        tiles.append(imageURLs[1])
        
        return tiles
    }
    
    func configure(forBanner banner : Banner){
        self.imageURLs = banner.imageURLs
        buildTiles()
    }
    
    func buildTiles() {
        let tiles = prepareTilesData()
        let tileCount = tiles.count
        
        var originX:CGFloat = 0.0
        for tileNo in 0..<tileCount {
            
            let url = tiles[tileNo]
            let tile = prepareTile(url)

            tile.frame = CGRect(x: originX,
                                y: 0,
                                width: self.bounds.width,
                                height: self.bounds.height)
            
            self.mainScrollView.addSubview(tile)
            
            originX = tile.frame.minX  + tile.frame.width
        }
        
        self.mainScrollView.isScrollEnabled = true
        self.mainScrollView.scrollsToTop = true
        self.mainScrollView.bounces = true
        mainScrollView.isPagingEnabled = true
        mainScrollView.showsHorizontalScrollIndicator = true
        mainScrollView.showsVerticalScrollIndicator = true
        mainScrollView.indicatorStyle = UIScrollViewIndicatorStyle.white
        
        mainScrollView.contentSize = CGSize(width: originX,
                                        height: self.bounds.height)
    }

    func prepareTile(_ imageURL: String) -> UIImageView {
        let image = UIImageView()
        
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.layer.shadowOpacity = 1
        image.layer.shadowOffset = CGSize(width: 5, height: 5);
        image.layer.shadowColor = UIColor.black.cgColor
        
        if let url = URL(string: imageURL) {
            image.loadImageWithURL(url)
        }
        
        image.isUserInteractionEnabled = true
        
        return image
    }
}

extension PromoOfferCell: UIScrollViewDelegate {
    
    
    
}
