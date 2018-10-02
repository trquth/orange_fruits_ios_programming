//
//  HomeViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 9/28/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit
import SwiftIconFont

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let collectionView : UICollectionView = {
        let flow  = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        let menuButton  = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        menuButton.icon(from: .fontAwesome, code: "bars", ofSize: 15)
        navigationItem.leftBarButtonItem = menuButton
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 15)]
        title = "Demo"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PartCell.self, forCellWithReuseIdentifier: "PartCell")
        view.addSubview(collectionView)
        
        let views = ["v1" : collectionView] as [String : Any]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v1]-10-|", options: [], metrics: [:], views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v1]-15-|", options: [], metrics: [:], views: views))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartCell", for: indexPath)
        return cell
    }

}

class PartCell: UICollectionViewCell {
    
    let namePart : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        return label
    }()
    
    let icon : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        
        addSubview(namePart)
        addSubview(icon)
        
        let views = ["v1": namePart, "v2" : icon]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: [:], views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: [:], views: views))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
