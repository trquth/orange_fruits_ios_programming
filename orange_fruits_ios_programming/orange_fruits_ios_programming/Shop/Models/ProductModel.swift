//
//  ProductModel.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/3/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import UIKit

class ProductModel: NSObject {
    
    var alreadyAddShoppingCart : Bool = false
    var iconName : String?
    var title : String?
    var desc : String?
    var count : Int = 1
    var newPrice : String?
    var oldPrice : String?
    var selected : Bool  = false
    
    init(dict : [String : Any]) {
        super.init()
        
        self.iconName = dict["iconName"] as? String
        self.title = dict["title"] as? String
        self.desc = dict["desc"] as? String
        self.newPrice = dict["newPrice"] as? String
        self.oldPrice = dict["oldPrice"] as? String
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
    }
}
