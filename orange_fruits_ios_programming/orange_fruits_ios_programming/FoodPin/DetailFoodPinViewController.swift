//
//  DetailFoodPinViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/6/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class DetailFoodPinViewController : UIViewController{
    
    @IBOutlet var restaurantImageView : UIImageView!
    var restaurantImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantImageView.image = UIImage(named: restaurantImage)
    }
}
