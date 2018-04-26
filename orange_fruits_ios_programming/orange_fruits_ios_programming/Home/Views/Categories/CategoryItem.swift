//
//  CategoryItem.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CategoryItem: UIView {

    var model : CategoryItemModel = CategoryItemModel(){
        didSet {
            imageView.image = UIImage(named : model.imageName as! String)
            title.text = model.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let imageV = UIImageView(image: #imageLiteral(resourceName: "Fashion"))
        imageV.translatesAutoresizingMaskIntoConstraints = false
        
        imageV.contentMode = .scaleAspectFit
        return imageV
    }()
    
    let title : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        //label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "Fashion"
        
        return label
    }()
    
    func setUpView(){
        self.addSubview(imageView)
        self.addSubview(title)
        
        let views = ["v1": imageView,
                     "v2": title]
        
        self.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v1(24)]", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v2]", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(24)]-5-[v2]|", options: [], metrics: nil, views: views))
        
        //imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
