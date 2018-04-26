//
//  BrandOfferCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class BrandOfferCell: UICollectionViewCell{
    
    var imageURLs = [String]()
    let brandOfferItemCellId = "brandOfferItemCellId"
    
    var model : BannerModel?{
        didSet {
            var imageURLArray = [String]()
            if let imageUrlsObj = model?.imageURLs {
                for item in imageUrlsObj{
                    imageURLArray.append(item)
                }
            }
            
            imageURLs = imageURLArray
            brandOfferCollectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        
    }
        
    let brandOfferCollectionView : UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    let topBrandOfferLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Top Brand Offers"
        
        return label
    }()
    
    let viewAllButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("View All", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(HomeViewController.didClickCategoryOfferViewAll(btn:)), for: .touchUpInside)
        
        return button
    }()
    
    func setUpViews(){
        backgroundColor = UIColor.clear
        
        addSubview(topBrandOfferLabel)
        addSubview(viewAllButton)
        addSubview(brandOfferCollectionView)
        
        brandOfferCollectionView.dataSource = self
        brandOfferCollectionView.delegate = self
        
        brandOfferCollectionView.register(BrandOfferItemCell.self, forCellWithReuseIdentifier: brandOfferItemCellId)
        
        let views = ["v1" : topBrandOfferLabel,
                 "v2" : viewAllButton,
                 "v3": brandOfferCollectionView]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v1]", options: [], metrics: nil, views: views))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v2(80)]-10-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(30)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2(==v1)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v3]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1(30)][v3]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2(30)][v3]|", options: [], metrics: nil, views: views))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension BrandOfferCell  :
    UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,
UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2, height: frame.height - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: brandOfferItemCellId, for: indexPath) as! BrandOfferItemCell
        cell.url = imageURLs[indexPath.row]
        return cell
    }
}
