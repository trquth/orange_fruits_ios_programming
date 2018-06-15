//
//  CartViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit
import RealmSwift



class CartViewController: UIViewController {
    
    private let Item_Cart = "ItemCart"
    private var orders : [OrderModel] = []
   

    override func viewDidLoad() {
        super.viewDidLoad()

        cartCollection.delegate = self
        cartCollection.dataSource = self
        
        cartCollection.register(ItemCartCollectionViewCell.self, forCellWithReuseIdentifier: Item_Cart)
        
        setupViews()
        getOrderedProduct()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let cartCollection : UICollectionView = {
        let flowLayout  = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        
        return collection
    }()
    
    func setupViews() {
        view.addSubview(cartCollection)
        
        let views = ["v1": cartCollection]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
    }
    
    func getOrderedProduct() -> [OrderModel] {
        orders = OrderService.shared.getAllProductsInCart()
        return orders
    }

    
}

extension CartViewController : CartCellDelegate {
    
    func updateQty(_ id: Int, _ type: UpdateType, complete: @escaping () -> ()) {
        
        OrderService.shared.updateProductQuantity(id, type ) {
            print("Update product quantity has been called")
            self.cartCollection.reloadData()
            
        }
        complete()
    }
    
    
}

extension CartViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: Item_Cart, for: indexPath) as! ItemCartCollectionViewCell
        cell.model = orders[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    
}
