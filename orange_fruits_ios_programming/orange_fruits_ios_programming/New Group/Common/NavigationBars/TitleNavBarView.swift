//
//  TitleNavBarView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

import UIKit

protocol TitleNavBarViewDelegate {
    func didGoBack()
}

class TitleNavBarView: UIView {
    
    let titleLabel = UILabel()
    let backButton = UIButton()
    
    var delegate: TitleNavBarViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect.zero)
        
        customizeAppearance()
        
        addTitleLabel()
        addBackButton()
    }
    
    override func layoutSubviews() {
        self.frame = CGRect(x: 0, y: 0, width: superview!.bounds.width, height: 44)
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
        titleLabel.sizeToFit()
    }
    
    func hideBackButton() {
        backButton.isHidden = true
    }
    
    @objc func didGoBack() {
        delegate?.didGoBack()
    }
    
    private
    
    func customizeAppearance() {
        self.backgroundColor = UIColor.primary
    }
    
    func addTitleLabel() {
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        
        titleLabel.font = UIFont(name: "Helvetica Bold", size: 16)
        
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func addBackButton() {
        backButton.setImage(UIImage(named: "Back"), for: .normal)
        backButton.setImage(UIImage(named: "Back"), for: .highlighted)
        
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        backButton.addTarget(self, action: #selector(didGoBack), for: .touchUpInside)
        
        addSubview(backButton)
    }
}

