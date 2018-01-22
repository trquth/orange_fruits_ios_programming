//
//  HeaderTodoTableView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/18/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class HeaderTodoTableView : UITableViewHeaderFooterView{
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MY LIST"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        //progress.backgroundColor = .blue
        progress.progressViewStyle = .bar
        progress.setProgress(0.8, animated: true)
        
//        progress.progressTintColor = .red
//        progress.trackTintColor = .brown
//        progress.tintColor = .green
        
        return progress
    }()
    
    fileprivate func setupViews(){
        addSubview(titleLabel)
        addSubview(progressView)
        
        let views = ["v1": titleLabel,
                     "v2": progressView]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v1]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v2]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v1][v2(2)]|", options: [], metrics: nil, views: views))
        
    }
}
