//
//  CartViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        cartCollection.delegate = self
        cartCollection.dataSource = self
        
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let cartCollection : UICollectionView = {
        let collection = UICollectionView()
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    func setupViews() {
        view.addSubview(cartCollection)
        
        cartCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cartCollection.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}

extension CartViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
