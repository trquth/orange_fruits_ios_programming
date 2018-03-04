//
//  CollectionViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/16/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId  = "CollectionViewCellId"
    let headerId = "CollectionReusableViewHeaderId"
    let footerId = "CollectionReusableViewFooterId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UIKit - CollectionView - Swift"
        
        mainCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        mainCollectionView.register(CollectionReusableViewHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
         mainCollectionView.register(CollectionReusableViewFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        
        setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        self.edgesForExtendedLayout = []
    }
    
    let mainCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        collectionView.autoresizingMask = .flexibleHeight
        collectionView.backgroundColor = UIColor(red: 230 / 255 , green: 229 / 255, blue: 234 / 255, alpha: 1)
        
        return collectionView
    }()
    
    func setupView()  {
        
        mainCollectionView.frame = view.bounds
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        view.addSubview(mainCollectionView)
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId ,  for: indexPath) as! CollectionViewCell
        
        cell.layer.borderColor =  UIColor.lightGray.cgColor
        cell.layer.borderWidth = 2
        
        cell.data = indexPath.item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: widthCell, height: CGFloat(heightCell))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: width, height: heightHeader)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: width, height: heightHeader)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableView : UICollectionReusableView!
        
        if kind == UICollectionElementKindSectionHeader {
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            reusableView.backgroundColor = .orange
            
            (reusableView as! CollectionReusableViewHeader).labelHeader.text = "Header \(indexPath.section + 1)"
        }else{
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
            reusableView.backgroundColor = .blue
            
            (reusableView as! CollectionReusableViewFooter).labelFooter.text = "Footer \(indexPath.section + 1)"
        }
        
        return reusableView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertView(title: nil, message: "Call at \(indexPath.item)", delegate: nil, cancelButtonTitle: "Close")
        alert.show()
    }
}
