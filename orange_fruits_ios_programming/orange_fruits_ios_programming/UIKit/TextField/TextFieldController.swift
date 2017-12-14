//
//  TextFieldController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/14/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class TextFieldController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "UIKit - TextField - Swift"
        
        view.backgroundColor = .white
        
        setupView()
    }
    
    let textField : UITextField = {
        let textField = UITextField(frame: CGRect(x: 10, y: 100, width: 200, height: 40))
        
        textField.textColor = .black
        textField.font = UIFont(name: "Sinhala Sangam MN", size: 15)
        textField.placeholder = "Input text value"
        textField.isSecureTextEntry = true
        
        textField.borderStyle = UITextBorderStyle.roundedRect
        
        textField.backgroundColor = UIColor(red: 234/255, green: 239/255, blue: 230/255, alpha: 1)
        
        let leftView = UIImageView(image: #imageLiteral(resourceName: "pencil"))
        leftView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textField.leftViewMode = .always
        textField.leftView = leftView
        
        textField.clearButtonMode = .whileEditing
        
        textField.keyboardType = .webSearch
        textField.returnKeyType = .done
        
        return textField
    }()
    
    
    func setupView() {
        view.addSubview(textField)
        
        let accessoryView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 40))
        accessoryView.backgroundColor = UIColor(red: 232/255, green: 225/255, blue: 230/255, alpha: 1)
        
        let accessoryLeft = UIButton(frame: CGRect(x: 10, y: 10, width: 60, height: 20))
        accessoryView.addSubview(accessoryLeft)
        accessoryLeft.setTitle("Cancel", for: .normal)
        accessoryLeft.backgroundColor = .red
        accessoryLeft.layer.cornerRadius = 2
        accessoryLeft.layer.masksToBounds = true
        
        let accessoryRight = UIButton(frame: CGRect(x: view.bounds.width - 10 - 60 - 10, y: 10, width: 70, height: 20))
        accessoryView.addSubview(accessoryRight)
        accessoryRight.setTitle("Confirm", for: .normal)
        accessoryRight.backgroundColor = .blue
        accessoryRight.layer.cornerRadius = 2
        accessoryRight.layer.masksToBounds = true
        
        textField.inputAccessoryView = accessoryView
        
    }
}
