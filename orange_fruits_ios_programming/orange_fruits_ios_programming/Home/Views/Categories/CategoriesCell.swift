//
//  CategoriesView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
   
    let taxonomies = ["Fashion", "Electronics", "Mobile", "Lifestyle", "More"]
    var categoriesStackView : UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.primary
        setUpView()
        
        renderListCategoryItems()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   func renderListCategoryItems(){
        for item in taxonomies {
            let categoryItem = CategoryItem()
            let model = CategoryItemModel()
            model.imageName = item
            model.title = item
            categoryItem.model = model
            self.categoriesStackView.addArrangedSubview(categoryItem)
        }
    }

    
    func setUpView() {
        self.categoriesStackView = UIStackView(frame: CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.bounds.height))
        self.categoriesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.categoriesStackView.axis = .horizontal
        self.categoriesStackView.alignment = .center
        self.categoriesStackView.distribution = .equalSpacing
        self.categoriesStackView.backgroundColor = .red
        
        self.addSubview(categoriesStackView)
        
        let views = ["v1" : categoriesStackView]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[v1]-25-|", options: [], metrics: nil, views: views))
         self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: views))
    }
}


