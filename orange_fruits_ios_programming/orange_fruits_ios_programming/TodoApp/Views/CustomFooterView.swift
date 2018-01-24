//
//  CustomFooterView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/20/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

//
//  FooterTodoTableView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/18/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CustomFooterView : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let connectedLabel: UILabel = {
        let label = UILabel()
        label.text = "Connected:"
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    let connectedStatusLabel : UILabel = {
        let label = UILabel()
        label.text = "Offline"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .orange
        return label
    }()
    
    let addNewTodoButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.cyan
        
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        button.layer.cornerRadius = 25
        button.layer.borderWidth =    1
        button.layer.borderColor = UIColor.cyan.cgColor
        
        button.addTarget(self, action: #selector(addNewTodo), for: .touchUpInside)
        
        return button
    }()
    
    @objc func addNewTodo(){
        let instance =  CreateTodoModal()
        instance.addNewTodo()
    }
    
    func setupView()  {
        self.backgroundColor = .white
        addSubview(connectedLabel)
        addSubview(connectedStatusLabel)
        addSubview(addNewTodoButton)
        
        let views = ["v1": connectedLabel,
                     "v2": connectedStatusLabel,
                     "v3": addNewTodoButton] as [String : Any]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v1]-5-[v2]", options: []  , metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v3(50)]-10-|", options: []  , metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2]", options:[], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v3(50)]", options:[], metrics: nil, views: views))
        
        addConstraint(NSLayoutConstraint(item: connectedLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: connectedStatusLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: addNewTodoButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
}

