//
//  CategoriesCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CategoriesCell: UITableViewCell {

    let taxonomies = ["Fashion", "Electronics", "Mobile", "Lifestyle", "More"]
    
    let stackView = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addStackView()
        addStackViewConstraints()
      
    }
    
    func configure(){
        buildTaxonomiesStack()
    }

    private
    
    func addStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        contentView.addSubview(stackView)
    }
    
    func addStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = contentView.layoutMarginsGuide
        stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 4).isActive = true
        stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 4).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func buildTaxonomiesStack() {
        for taxonomy in taxonomies {
            let view = CategoryItem()
            
            view.configure(type: taxonomy)
            view.addGestureRecognizer(tapGestureRecognizer())
            
            stackView.addArrangedSubview(view)
        }
    }
    
    func tapGestureRecognizer() ->  UITapGestureRecognizer {
                let tableView = self.superview as! UITableView
                let controller = tableView.delegate as! HomeViewController
        
                let tapGestureRecognizer = UITapGestureRecognizer(target: controller, action: #selector(controller.navigateToProducts))
                tapGestureRecognizer.cancelsTouchesInView = false
                tapGestureRecognizer.delegate = self
        
                return tapGestureRecognizer
    }
    

}

class CategoryItem : UIView {
    
    let width = 60
    let height = 48
    
    let imageWidth = 24
    let imageHeight = 24
    
    let labelWidth = 60
    let labelHeight = 16
    
    var label = UILabel()
    var imageView = UIImageView()
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        super.init(frame: frame)
        
        customizeAppearance()
        
        addCategoryNameLabel()
        addCategoryImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(type: String) {
        self.label.text = type
        
        self.imageView.image = UIImage(named: type)
    }
    
    func customizeAppearance() {
        self.backgroundColor = UIColor.primary
        
        self.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        self.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
    }
    
    func addCategoryNameLabel() {
        label.frame = CGRect(x: (width - labelWidth) / 2, y: (height - labelHeight) - 2, width: labelWidth, height: labelHeight)
        label.font = UIFont(name: "Helvetica-Bold", size: 10)
        label.textColor = .white
        label.textAlignment = .center
        
        addSubview(label)
    }
    
    func addCategoryImageView() {
        imageView.frame = CGRect(x: (width - imageWidth) / 2, y: 2, width: imageWidth, height: imageHeight)
        
        addSubview(imageView)
    }
}
