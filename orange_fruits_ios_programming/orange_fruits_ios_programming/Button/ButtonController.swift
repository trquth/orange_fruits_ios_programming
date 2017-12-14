//
//  ButtonController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 12/14/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class ButtonController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "UIKit - Button - Swift"
        setupView()
    }
    
    let button : UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.frame = CGRect(x: 10, y: 100, width: 200, height: 40)
        
        button.backgroundColor = UIColor(red: 39/255, green: 113/255, blue: 216/255, alpha: 0.5)
//        button.setBackgroundImage(#imageLiteral(resourceName: "turnon"), for: .normal)
//        button.setBackgroundImage(#imageLiteral(resourceName: "turnoff"), for: .highlighted)
        
        button.setImage(#imageLiteral(resourceName: "turnon"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "turnoff"), for: .highlighted)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0)
        
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.red, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 15)
        
        button.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        
        return button
    }()
    
    func setupView(){
        view.addSubview(button)
    }
    
    @objc func buttonClick(_ sender : UIButton) {
        if let nameBtn = button.titleLabel?.text {
            print(nameBtn)
        }
        
    }
}
