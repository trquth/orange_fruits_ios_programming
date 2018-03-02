//
//  MenuTableView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/10/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class MenuTableView : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let menuTableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
      //  table.frame = .zero
        table.backgroundColor = .clear
        table.separatorColor = .white
        table.contentInset = .zero
        
        return table
    }()
    
    func setupViews()  {
        addSubview(menuTableView)
        
        let views = ["v1": menuTableView]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: ("H:|[v1]|"), options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: ("V:|[v1]|"), options: [], metrics: nil, views: views))
    }
    
}
