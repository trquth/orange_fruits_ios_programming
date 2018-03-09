//
//  ReviewViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/8/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ReviewViewController : UIViewController{
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var restaurantImageView : UIImageView!
    @IBOutlet var closeButton: UIButton!
    
    var restaurant:Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurant = restaurant {
          restaurantImageView.image = UIImage(named: restaurant.image)
        }
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //containerView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        
        closeButton.transform = CGAffineTransform.init(translationX: 1000, y: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, animations: { self.containerView.transform = CGAffineTransform.identity })
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            
            self.closeButton.transform = CGAffineTransform.identity
            
        }, completion: nil)
    }
    
    
}
