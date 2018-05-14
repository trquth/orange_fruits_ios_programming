//
//  OrderModel.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 5/5/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import RealmSwift

class OrderModel : Object {

    @objc dynamic var id : Int = 0
    @objc dynamic var productName : String = ""
    @objc dynamic var quantity : Int = 0
    @objc dynamic var price : Double = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
