//
//  FooterProductView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/25/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class FooterProductView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let addToCartButton : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonAttributeString = NSAttributedString(string: "ADD TO CART",
                                                       attributes: [NSAttributedStringKey.foregroundColor : UIColor.black])
        var buttonHighLightAttributeString = NSAttributedString(string: "ADD TO CART",
                                                       attributes: [NSAttributedStringKey.foregroundColor : UIColor.gray])
        //button.setTitle("SELECT", for: .normal)
       // button.setTitle("UNSELECT", for: .highlighted)
        //button.setTitleColor(UIColor.black, for: .normal)
        button.setAttributedTitle(buttonAttributeString, for: .normal)
        button.setAttributedTitle(buttonHighLightAttributeString, for: .highlighted)
        
//        button.setBackgroundColor(color: .white, forState: .normal)
//        button.setBackgroundColor(color: .gray, forState: .highlighted)
        //button.setTitleColor(UIColor.red, for: .highlighted)
        button.backgroundColor = .white
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(didAddToCart(btn:)), for: .touchUpInside)
        
        return button
    }()
    
    let buyNowButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("BUY NOW", for: .normal)
        button.backgroundColor = .orange
        
        return button
        
    }()
    
    func setUpViews()  {
        addSubview(addToCartButton)
        addSubview(buyNowButton)
        
        var views = [String : Any]()
        views["v1"] = addToCartButton
        views["v2"] = buyNowButton
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1][v2(==v1)]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2]|", options: [], metrics: nil, views: views))
    }
    
    @objc func didAddToCart(btn : UIButton){
        
        print("ADD TO CART")
        
    }
}
