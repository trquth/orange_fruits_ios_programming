//
//  VisualEffectBlurPopup+Extension.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class VisualEffectBlurPopup : UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleModal: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.text = "Add Todo"
        title.font = UIFont.systemFont(ofSize: 14)
        
        return title
    }()
    
    var addItemView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 5
        
       // view.addSubview(titleModal)
        return view
    }()
}
