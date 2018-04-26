//
//  TitleNavBarView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class TitleNavBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpConstraint()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Spree"
        label.textColor = .white
        label.textAlignment = .center
        label.sizeToFit()
        label.font = UIFont(name: "Helvetica Bold", size: 16)
        
        return label
    }()
    
    func setUpConstraint(){
        self.addSubview(titleLabel)
        
        self.backgroundColor = UIColor.primary
        
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setTitle(_ title: String){
        titleLabel.text = title
    }

}
