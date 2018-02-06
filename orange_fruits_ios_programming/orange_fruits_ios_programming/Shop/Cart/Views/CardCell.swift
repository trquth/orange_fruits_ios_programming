//
//  CardRow.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/3/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CartCell : UITableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didSelectedButton(button : UIButton){
        button.isSelected = !button.isSelected
    }
    
    @objc private func didAddButton(button: UIButton){
        button.isSelected = !button.isSelected
    }
    
    lazy var selectedButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(named: "check_n"), for: .normal)
        button.setImage(UIImage(named: "check_p"), for: .selected)
        
        button.addTarget(self, action: #selector(didSelectedButton(button:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var stickerIcon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "git-600x600")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = true
        
        image.contentMode = .scaleToFill
        
        return image
    }()
    
    lazy var addAndSubtraction : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 4
        view.backgroundColor = .gray
        
        return view
    }()
    
    lazy var addButton : UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let addButtonAttributedNormal = NSAttributedString(string: "+",
                                                          attributes: [NSAttributedStringKey.foregroundColor : UIColor.gray, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 25)])
        button.setAttributedTitle(addButtonAttributedNormal, for: .normal)

        let addButtonAttributedSelected = NSAttributedString(string: "+",
                                                          attributes: [NSAttributedStringKey.foregroundColor : UIColor.lightGray, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 25)])
        button.setAttributedTitle(addButtonAttributedSelected, for: .selected)
        
        button.backgroundColor = .white
        
        button.addTarget(self, action: #selector(didAddButton(button:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var substractionButton : UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tag = 10
        let subtractionButtonAttributedTitleNormal = NSAttributedString(string: "-",
                                                          attributes: [NSAttributedStringKey.foregroundColor : UIColor.gray, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 25)])
        button.setAttributedTitle(subtractionButtonAttributedTitleNormal, for: .normal)
        
        let subtractionButtonAttributedSelected = NSAttributedString(string: "-",
                                                                  attributes: [NSAttributedStringKey.foregroundColor : UIColor.lightGray, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 25)])
        button.setAttributedTitle(subtractionButtonAttributedSelected, for: .selected)
        
        button.backgroundColor = .white
        //button.showsTouchWhenHighlighted = true
        //button.setTitleColor(.red, for: .highlighted)
        
        return button
    }()
    
    lazy var countLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        label.textColor = .white
        label.text = "1"
        return label
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Git"
        
        return label
    }()
    
    lazy var newPriceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let newPriceAttribute = NSAttributedString(string: "$2.99", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 23), NSAttributedStringKey.foregroundColor : UIColor.red])
        label.attributedText = newPriceAttribute
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var oldPriceLabel : OldPriceLabel = {
        let label = OldPriceLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        var oldPriceAttribute = NSMutableAttributedString(string: "$2.00", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18), NSAttributedStringKey.foregroundColor : UIColor.gray])
        
//        oldPriceAttribute.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: 0, length: oldPriceAttribute.length ))
        
        label.attributedText = oldPriceAttribute
        label.textAlignment = .center
        
        
        
        return label
    }()
    
    func setupViews()  {
        addSubview(selectedButton)
        addSubview(stickerIcon)
        addSubview(addAndSubtraction)
        addSubview(titleLabel)
        addSubview(newPriceLabel)
        addSubview(oldPriceLabel)
        addAndSubtraction.addSubview(addButton)
        addAndSubtraction.addSubview(countLabel)
        addAndSubtraction.addSubview(substractionButton)
      
        
        let views = ["v1": selectedButton,
                     "v2": stickerIcon,
                     "v3": addAndSubtraction,
                     "v4": addButton,
                     "v5": substractionButton,
                     "v6": countLabel,
                     "v7": titleLabel,
                     "v8": newPriceLabel,
                     "v9": oldPriceLabel]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1(30)]", options: [], metrics: nil, views: views))
        addConstraint(NSLayoutConstraint(item: selectedButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v1(30)]-[v2(80)]-[v7]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2(80)]", options: [], metrics: nil, views: views))
        addConstraint(NSLayoutConstraint(item: stickerIcon, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v7]-[v3(40)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v2(80)]-[v3(110)]", options: [], metrics: nil, views: views))
        
        addAndSubtraction.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v5(40)][v6(30)][v4(==v5)]|", options: [], metrics: nil, views: views))
        addAndSubtraction.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v5(==v3)]|", options: [], metrics: nil, views: views))
        addAndSubtraction.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v6(==v3)]|", options: [], metrics: nil, views: views))
        addAndSubtraction.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v4(==v3)]|", options: [], metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v8][v9]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v8(70)]-10-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v8(70)]-10-|", options: [], metrics: nil, views: views))

        addConstraint(NSLayoutConstraint(item: newPriceLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v9(==v8)]-10-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v9(==v8)]-10-|", options: [], metrics: nil, views: views))
        
    }
    
}
