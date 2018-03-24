//
//  Cart.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/22/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import SwiftyJSON

class Card {
    
    var id: Int?
    var type: String?
    var name: String?
    var number: String?
    var lastDigits: String?
    var expiryMonth: Int?
    var expiryYear: Int?
    var isDefault: Bool?
    
    var expiryDate: String? {
        if let month = expiryMonth, let year = expiryYear {
            return "\(month) / \(year)"
        } else {
            return nil
        }
    }
    
    init(fromJSON json: JSON) {
        self.id = json["id"].intValue
        self.type = json["cc_type"].stringValue
        self.name = json["name"].stringValue
        self.number = json["number"].stringValue
        self.lastDigits = json["last_digits"].stringValue
        self.expiryMonth = json["month"].intValue
        self.expiryYear = json["year"].intValue
        self.isDefault = json["default"].boolValue
    }
}

