//
//  CartViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/3/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    let cartCellId = "cartCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        setupViews()
        
    }
    
    lazy var tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    lazy var bottomView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    lazy var totalPriceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attributeText = NSMutableAttributedString(string: "Total: \(1000)", attributes: [NSAttributedStringKey.foregroundColor : UIColor.red])
        label.attributedText = attributeText
        
        label.textAlignment = .center
        return label
    }()
    
    lazy var checkoutButton : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let titleAttributeString = NSMutableAttributedString(string: "Checkout", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        
        button.setAttributedTitle(titleAttributeString, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        button.backgroundColor = UIColor(red: 234/255, green: 42/255, blue: 63/255, alpha: 1)
        return button
    }()
    
    func prepareUI()  {
        
        navigationItem.title = "Sticker Cart"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didTappedBackButton))
        //navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)
        
        navigationController?.navigationBar.tintColor = .white
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 0, blue: 168/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20)]
        
        tableView.register(CartCell.self, forCellReuseIdentifier: cartCellId)
    }
    
    func setupViews() {
        view.addSubview(tableView)
        view.addSubview(bottomView)
        bottomView.addSubview(totalPriceLabel)
        bottomView.addSubview(checkoutButton)
        
        let views = ["v0": tableView,
                     "v1": bottomView,
                     "v2": totalPriceLabel,
                     "v3": checkoutButton]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: views))
         view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0][v1(60)]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        
        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v2]-[v3(100)]-5-|", options: [], metrics: nil, views: views))
        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2]|", options: [], metrics: nil, views: views))
        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v3(40)]", options: [], metrics: nil, views: views))
    
        bottomView.addConstraint(NSLayoutConstraint(item: checkoutButton, attribute: .centerY, relatedBy: .equal, toItem: bottomView , attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    @objc func didTappedBackButton(){
        dismiss(animated: true, completion: nil)
    }
    
}
