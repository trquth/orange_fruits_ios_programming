//
//  ColorPickerViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 6/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

let ColorPickerNotification = "com.caicho.orange-fruits-ios-programming.ColorPickerViewController.didPickColor"
let ColorPickerSelectedColorKey = "com.caicho.orange-fruits-ios-programming.ColorPickerViewController.selectedColor"

class ColorPickerViewController: UIViewController {
    
    let colors = [
        ("Cyan", UIColor.cyan),
        ("Magenta", UIColor.magenta),
        ("Yellow", UIColor.yellow)
    ]
    
    var initialColor : UIColor?
    weak var delegate : ColorPickerDelegate?
    var doneHandler : ((UIColor?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        var selectedIndex = UISegmentedControlNoSegment
        
        colorSegmentControl.removeAllSegments()
        
        view.addSubview(colorSegmentControl)
        view.addSubview(confirmButton)
        
        let views = ["v1" : colorSegmentControl,
                     "v2" : confirmButton]
        
        view.centerYAnchor.constraint(equalTo: colorSegmentControl.centerYAnchor).isActive = true
        view.centerXAnchor.constraint(equalTo: colorSegmentControl.centerXAnchor).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1]-10-[v2(40)]", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v2(80)]", options: [], metrics: nil, views: views))
        view.centerXAnchor.constraint(equalTo: confirmButton.centerXAnchor).isActive = true
        
        for (index, color) in colors.enumerated() {
            if color.1.isEqual(initialColor){
                selectedIndex = index
            }
            colorSegmentControl.insertSegment(withTitle: color.0, at:index , animated: false)
        }
        
        colorSegmentControl.selectedSegmentIndex = selectedIndex
        
    }
    
    let colorSegmentControl : UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.translatesAutoresizingMaskIntoConstraints = false
        
        return segment
    }()
    
    let confirmButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.orange
        
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        
        button.addTarget(self, action: #selector(confirmButtonTapNotificationCenter), for: .touchUpInside)
        
        return button
    }()
    
    func colorFromSelection() -> UIColor? {
        let selectedIndex = colorSegmentControl.selectedSegmentIndex
        if selectedIndex != UISegmentedControlNoSegment {
            return colors[selectedIndex].1
        }
        return nil
    }
    
    @objc func confirmButtonTap(){
       // delegate?.colorPicker(picker: self, didPickColor: self.colorFromSelection())
        //closure
        doneHandler?(self.colorFromSelection())
        dismiss(animated: false, completion: nil)
    }
    
    @objc func confirmButtonTapNotificationCenter(){
        var selectionInfo = Dictionary<String, UIColor>()
        if let selectedColor = colorFromSelection(){
            selectionInfo[ColorPickerSelectedColorKey] = selectedColor
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ColorPickerNotification), object: self, userInfo: selectionInfo)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
