//
//  ProductsCollectionViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/3/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ProductsViewController: UIViewController {

    let ListProductCellId = "ListProductCellId"
    let GridProductCellId = "GridProductCellId"
    var currentPageNo =  1
    let productsPerPage = 10
    let totalPage = 4
    var products = [Product]()
    
    var currentProductView = Product.View.List
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setUpViews()
        
        fetchProducts(currentPageNo)
        
        setProductView(to: .List)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let productTitleView : TitleNavBarView = {
        let titleView = TitleNavBarView()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        return titleView
    }()
    
    let productNavBarView : ProductNavBarView = {
        let navBarView = ProductNavBarView()
        navBarView.translatesAutoresizingMaskIntoConstraints = false
        
        return navBarView
    }()

    
    let productsCollectionView : UICollectionView = {
        let listLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: listLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    
    func setUpViews(){
        
        view.addSubview(productTitleView)
        view.addSubview(productNavBarView)
        
        productNavBarView.delegate = self
        
        view.addSubview(productsCollectionView)
        productsCollectionView.register(ListProductCell.self, forCellWithReuseIdentifier: ListProductCellId)
        
        productsCollectionView.register(GridProductCell.self, forCellWithReuseIdentifier: GridProductCellId)
        
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
        view.addSubview(productNavBarView)
        
        
        let views = ["v1" : productsCollectionView,
                     "v2" : productTitleView,
                     "v3" : productNavBarView]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v2]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v3]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v2(40)][v3(40)]-0.5-[v1]|", options: [], metrics: nil, views: views))
    }
}

extension ProductsViewController :UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let product = products[indexPath.row]
        
        switch currentProductView {
        case .Grid:
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridProductCellId, for: indexPath) as! GridProductCell
            cell.configure(forProduct: product)
            
            fetchNextProducts(indexPath)
            
            return cell
        default:
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListProductCellId, for: indexPath) as! ListProductCell
            cell.configure(forProduct: product)
            
            fetchNextProducts(indexPath)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ProductViewController(), animated: true)
    }
    
}

extension ProductsViewController {
    
    func setProductView(to productView : Product.View){
        currentProductView = productView
        
        switch currentProductView {
        case .Grid:
            self.productsCollectionView.reloadData()
            
            let productGridFlowLayout = ProductGridFlowLayout()
            self.productsCollectionView.collectionViewLayout.invalidateLayout()
            self.productsCollectionView.setCollectionViewLayout(productGridFlowLayout, animated: false)
            
        default:
            self.productsCollectionView.reloadData()
            
            let productListFlowLayout = ProductListFlowLayout()
            self.productsCollectionView.collectionViewLayout.invalidateLayout()
            self.productsCollectionView.setCollectionViewLayout(productListFlowLayout, animated: false)
        }
    }
}

extension ProductsViewController : ProductNavBarViewDelegate {
    func didSortProducts() {
        print("TBD - Sorting products")
    }
    
    func didFilterProducts() {
        print("TBD - Filtering products")
    }
    
    func didChangeProductView(to productView: Product.View) {
        setProductView(to: productView)
        
        productsCollectionView.reloadData()
    }
}

extension ProductsViewController {
    
    func fetchProducts(_ pageNo : Int){
        var data = URLRequestParams()
        data["page"] = currentPageNo
        data["per_page"] = productsPerPage
        
        ProductApiClient.products(data, success:  {products in
            self.products += products
            self.productsCollectionView.reloadData()
            
        }, failure: {
            apiError in NSLog("Erro --> %@", apiError.errorMessage())
        })
        
    }
    
    func fetchNextProducts(_ indexPath : IndexPath)  {
        if indexPath.row == (currentPageNo * productsPerPage - 1) {
            if currentPageNo  < totalPage {
                self.currentPageNo += 1
                
                DispatchQueue.main.async {
                    self.fetchProducts(self.currentPageNo)
                }
            }
        }
    }
}
