//
//  HomeViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/3/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : UIViewController{
    
    var listProducts = [ProductModel]()
    let homeCellIdentifier = "homeCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDummyData()
        prepareUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupViews()
    }
    
    func createDummyData(){
        var dict = [String : Any]()
        dict["iconName"] = "c_sharp-600x600.png"
        dict["title"] = "C# Sticker"
        dict["desc"] = ""
        dict["newPrice"] = "2.99"
        dict["oldPrice"] = "2.99"
        listProducts.append(ProductModel(dict: dict))
        
        dict["iconName"] = "firebase-sticker-adesivo-600x600.png"
        dict["title"] = "Firebase Sticker"
        dict["desc"] = "Vinyl Sticker printed with solvent-free latex paint and scratch resistant. Ecologically correct and quality product."
        dict["newPrice"] = "2.99"
        dict["oldPrice"] = "2.99"
        listProducts.append(ProductModel(dict: dict))
        
        
        dict["iconName"] = "git-600x600.png"
        dict["title"] = "Git Sticker"
        dict["desc"] = ""
        dict["newPrice"] = "2.99" as! String
        dict["newPrice"] = "2.99"
        listProducts.append(ProductModel(dict: dict))

        dict["iconName"] = "js-600x600.png"
        dict["title"] = "JS Sticker"
        dict["desc"] = "Vinyl Sticker printed with solvent-free latex paint and scratch resistant. Ecologically correct and quality product."
        dict["newPrice"] = "2.99"
        dict["oldPrice"] = "2.99"
        listProducts.append(ProductModel(dict: dict))

        dict["iconName"] = "nodejs2-600x600.png"
        dict["title"] = "NodeJs Sticker"
        dict["desc"] = "Vinyl Sticker printed with solvent-free latex paint and scratch resistant. Ecologically correct and quality product."
        dict["newPrice"] = " 2.99"
        dict["oldPrice"] = "2.99"
        listProducts.append(ProductModel(dict: dict))

        dict["iconName"] = "npm-600x600.png"
        dict["title"] = "NPM Sticker!"
        dict["desc"] = ""
        dict["newPrice"] = "2.99"
        dict["oldPrice"] = "2.99"
        listProducts.append(ProductModel(dict: dict))

        dict["iconName"] = "react-logo-sticker-adesivo-600x600.png" as! String
        dict["title"] = "React Logo Sticker" as! String
        dict["desc"] = "Vinyl Sticker printed with solvent-free latex paint and scratch resistant. Ecologically correct and quality product."
        dict["newPrice"] = "2.99"
        dict["oldPrice"] = "2.99"
        listProducts.append(ProductModel(dict: dict))

        dict["iconName"] = "reactivex-sticker-adesivo-logo-600x600.png"
        dict["title"] = "ReactiveX Sticker"
        dict["desc"] = "Sticker in vinyl printed in high resolution. Ideal for notebooks but as it is waterproof and resistant to sunlight can be used even in outdoor applications such as cars, windows with optimal durability."
        dict["newPrice"] = "2.99"
        dict["oldPrice"] = "2.99"
        listProducts.append(ProductModel(dict: dict))

        dict["iconName"] = "swift-600x600.png"
        dict["title"] = "Swift Sticker"
        dict["desc"] = "Vinyl Sticker printed with solvent-free latex paint and scratch resistant. Ecologically correct and quality product."
        dict["newPrice"] = "2.99"
        dict["oldPrice"] = "2.99"
        listProducts.append(ProductModel(dict: dict))

        dict["iconName"] = "webpack-sticker-adesivo-logo-600x600.png"
        dict["title"] = "Webpack logo Sticker"
        dict["desc"] = "Sticker in vinyl printed in high resolution. Ideal for notebooks but as it is waterproof and resistant to sunlight can be used even in outdoor applications such as cars, windows with optimal durability."
        dict["newPrice"] = "2.99"
        dict["oldPrice"] = "2.99"
        listProducts.append(ProductModel(dict: dict))
        
    }
    
    func prepareUI(){
        navigationItem.title = "Sale list stickers"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 0, blue: 168/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20)]
        
        tableView.register(HomeCell.self, forCellReuseIdentifier: homeCellIdentifier)
        
    }
    
    func setupViews(){
        view.addSubview(tableView)
        
        let views = ["v0": tableView]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: views))
    }
    
    lazy var tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.showsVerticalScrollIndicator = false
        
        table.delegate = self as UITableViewDelegate
        table.dataSource = self as UITableViewDataSource
        
        return table
    }()
    
    lazy var cartButton : UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(UIImage(named: "shopping-cart"), for: .normal)

        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        button.addTarget(self, action: #selector(didTappedCartButton) , for: .touchUpInside)
        
        return button
    }()
    
   @objc func didTappedCartButton(){
        let cartCtrl = CartViewController()
        present(UINavigationController(rootViewController: cartCtrl), animated: true, completion: nil)
    }
}
