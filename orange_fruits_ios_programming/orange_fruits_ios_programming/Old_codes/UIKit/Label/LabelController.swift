//
//  LabelController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/13/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class LabelController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Label"
        view.backgroundColor = .white
        
        setView()
    }
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "UIKit - UILabel - Label - IOS - Swift Programming - XCode"
        label.backgroundColor = UIColor(red: 102/255, green: 232/255, blue: 221/255, alpha: 1)
        
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont(name: "Menlo-Regular", size: 15)
        label.textColor = .blue
        //label.adjustsFontSizeToFitWidth = true
        //label.numberOfLines = 1
        
        label.isHighlighted = true
        label.highlightedTextColor = .red
        
        label.shadowColor = .green
        label.shadowOffset = CGSize(width: 5, height: 5)
        
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.borderWidth = 2
        
        label.isHidden = false
        
        
        return label
    }()
    
    let secondLabel : UILabel = {
        let label = UILabel()
        let secondText = "The second label - 😇 "
        label.backgroundColor = UIColor(red: 232/255, green: 177/255, blue: 102/255, alpha: 1)
        
        let attributeString = NSMutableAttributedString(string: secondText)
        attributeString.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "KohinoorDevanagari-Light", size: 15)!, range: NSMakeRange(0, secondText.characters.count))
        attributeString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range:  NSMakeRange(0, secondText.characters.count))
        attributeString.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.gray, range:  NSMakeRange(0, secondText.characters.count))
        
        label.attributedText = attributeString
        
        return label
    }()
    
    func setView() {
        view.addSubview(label)
        label.frame = CGRect(x: 10, y: 100, width: view.bounds.width - 10 * 2, height: 60)
        view.addSubview(secondLabel)
        secondLabel.frame = CGRect(x: 10, y: label.bounds.height + label.frame.midY + 10, width: view.bounds.width - 10 * 2, height: 60)
    }
}
