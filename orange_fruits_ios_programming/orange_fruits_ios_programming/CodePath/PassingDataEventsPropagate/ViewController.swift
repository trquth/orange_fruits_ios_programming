//
//  ViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 6/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ColorPickerDelegate {
    func colorPicker(picker: ColorPickerViewController, didPickColor color: UIColor?) {
        if let color = color {
            view.backgroundColor = color
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(button)
        
        let views = ["v1" : button]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1(40)]", options: [], metrics: nil , views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v1(200)]", options: [], metrics: nil , views: views))
        
        view.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let button : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.orange
        button.setTitle("Open Color Picker", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        
        button.addTarget(self, action: #selector(openColorPicker), for: .touchUpInside)
        return button
    }()
    
   @objc func openColorPicker() {
        let colorPickerVC = ColorPickerViewController()
        colorPickerVC.delegate = self
        colorPickerVC.initialColor = view.backgroundColor
        present(colorPickerVC, animated: true, completion: nil)
    }

}
