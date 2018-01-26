//
//  VisualEffectBlurPopup+Extension.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class VisualEffectBlurPopup : UIView{
    
//    var visualEffectView : UIVisualEffectView!
//    var effect : UIVisualEffect!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
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
        
        return view
    }()
    
    private func setupViews(){
        addSubview(addItemView)
        
        addItemView.addSubview(titleModal)
        
        let views = ["v1": titleModal]
        
        addItemView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        addItemView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(20)]|", options: [], metrics: nil, views: views))
    }
    
    func animateIn()  {
//        if var topController = UIApplication.shared.keyWindow?.rootViewController{
//            while let presentedViewController  = topController.presentedViewController{
//                topController = presentedViewController
//            }
//
//
//        }
        addSubview(addItemView)
        
//        UIView.animate(withDuration: 0.4, animations: {() in
//            self.visualEffectView.effect = self.effect
//            self.addItemView.alpha = 1
//            self.addItemView.transform = CGAffineTransform.identity
//        })
    }
    
    func animateOut()  {
//        UIView.animate(withDuration: 0.3, animations: {() in
//            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
//            self.addItemView.alpha = 0
//            
//            self.visualEffectView.effect = nil
//        }){(success) in
//            self.addItemView.removeFromSuperview()
//        }
    }
}
