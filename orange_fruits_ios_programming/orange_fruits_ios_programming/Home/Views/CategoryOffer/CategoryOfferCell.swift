//
//  CategoryOfferCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/2/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CategoryOfferCell: UICollectionViewCell {
    
    fileprivate let categoryOfferCellId = "CategoryOfferCellId"
    fileprivate var imageURLs = [String]()
    
    var model : BannerModel? {
        didSet{
            var imageURLArray = [String]()
            if let imageUrlsObj = model?.imageURLs {
                for item in imageUrlsObj{
                    imageURLArray.append(item)
                }
            }
            
            imageURLs = imageURLArray
            categoryOfferCollectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let categoryOfferCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    let categoryOfferLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Top Category Offers"
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    let viewAllButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("View All", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.backgroundColor = .blue
        
        button.addTarget(self, action: #selector(HomeViewController.didClickCategoryOfferViewAll(btn:)), for: .touchUpInside)
        
        return button
    }()
    
    func  setUpViews(){
        addSubview(categoryOfferLabel)
        addSubview(viewAllButton)
        addSubview(categoryOfferCollectionView)
        
        categoryOfferCollectionView.register(CategoryOfferItemCell.self, forCellWithReuseIdentifier: categoryOfferCellId)
        
        categoryOfferCollectionView.dataSource = self
        categoryOfferCollectionView.delegate = self
        
        let views = ["v1": categoryOfferLabel,
                     "v2": viewAllButton,
                     "v3": categoryOfferCollectionView]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v1]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(30)]",options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v2(80)]-10-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2(==v1)]",options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1(30)][v3]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2(30)][v3]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v3]|",options: [], metrics: nil, views: views))
    }
    
}

extension CategoryOfferCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryOfferCellId, for: indexPath) as! CategoryOfferItemCell
        cell.url = imageURLs[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2, height: frame.height - 32)
    }
    
    
}
