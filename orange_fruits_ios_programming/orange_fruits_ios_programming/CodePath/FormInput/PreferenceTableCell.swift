//
//  PreferenceTableCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 6/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import UIKit

class PreferenceTableCell : UITableViewCell {
    
    var delegate : PreferenceSwitchCellDelegate?
    var prefRowIndentifier : PrefRowIdentifier!{
        didSet {
            titleLbl.text = prefRowIndentifier.rawValue
            switchBtn.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLbl : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        
        return label
    }()
    
    let switchBtn : UISwitch = {
        let switchB = UISwitch()
        switchB.translatesAutoresizingMaskIntoConstraints = false
        
        return switchB
    }()
    
    @objc func switchValueDidChange() {
        delegate?.preferenceSwitchCellDidToggle(cell: self, newValue: switchBtn.isOn)
    }
    
    func setupViews() {
        addSubview(titleLbl)
        addSubview(switchBtn)
        
        let views = ["v1": titleLbl,
                     "v2":switchBtn]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1]", options: [], metrics: nil, views: views))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v1][v2]-10-|", options: [], metrics: nil, views: views))
        
        titleLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        switchBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
