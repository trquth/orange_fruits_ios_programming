//
//  ProductNavView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/3/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

protocol ProductNavBarViewDelegate {
    func didSortProducts()
    func didFilterProducts()
    func didChangeProductView(to: Product.View)
}

class ProductNavBarView: UIView {
    
    var currentProductView = Product.View.List
    var delegate : ProductNavBarViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: frame.width - 1, width: frame.width - 1, height: 1)
        self.layer.addSublayer(bottomBorder)
        
        viewButton.frame = CGRect(x: 0, y: 0, width: 10, height: frame.height )
       
         //left
        let leftBorder = CALayer()
        leftBorder.backgroundColor = UIColor.lightGray.cgColor
        leftBorder.frame = CGRect(x: viewButton.frame.width , y: 0, width: 1, height: frame.height)
        
        sortButton.layer.addSublayer(leftBorder)
        //right
        let rightBorder = CALayer()
        rightBorder.backgroundColor = UIColor.lightGray.cgColor
        rightBorder.frame = CGRect(x: viewButton.frame.width + (frame.width - viewButton.frame.width) / 2, y: 0, width: 1, height: frame.height)
        sortButton.layer.addSublayer(rightBorder)
       
    }
    
    let viewButton : UIButton = {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(named : "List"), for: .normal)
        button.addTarget(self, action: #selector(didChangeView), for: .touchUpInside)
        return button
    }()
    
    let sortButton : UIButton = {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle( "Sort", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 14)
        
        button.layer.addBorder(.left, color: UIColor.lightGray, thickness: 1)
        button.layer.addBorder(.right, color: UIColor.lightGray, thickness: 1)
        
         button.addTarget(self, action: #selector(didSortProducts), for: .touchUpInside)
        
        return button
    }()
    
    let filterButton : UIButton = {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Filter", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 14)
        
        return button
    }()
    
    func setUpViews() {
        setProductView(.List)
        
        addSubview(viewButton)
        addSubview(sortButton)
        addSubview(filterButton)
        
        let views = ["v1": viewButton,
                     "v2": sortButton,
                     "v3": filterButton]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1(50)]-2-[v2]-2-[v3(==v2)]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v3]|", options: [], metrics: nil, views: views))
    }
    
    @objc func didChangeView(){
        toogleProductView()
        delegate?.didChangeProductView(to: currentProductView)
    }
    
    @objc func didSortProducts(){
        delegate?.didSortProducts()
    }
    
    func didFilterProducts(){
        delegate?.didFilterProducts()
    }
    
    func toogleProductView(){
        switch currentProductView {
        case .Grid: setProductView(.List); break
        default:
            setProductView(.Grid)
            break
        }
    }
    
    func setProductView(_ productView : Product.View) {
        self.currentProductView = productView
        
        switch productView {
        case .Grid:
            self.viewButton.setImage(UIImage(named : "Grid"), for: .normal)
            break
        default:
            self.viewButton.setImage(UIImage(named : "List"), for: .normal)
            break
        }
    }
}
