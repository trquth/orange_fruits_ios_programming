//
//  ProductProperty.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/18/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import SwiftyJSON

class ProductProperty {
    var id: Int?
    var name: String?
    var value: String?
    
    init(fromJSON json: JSON) {
        self.id = json["id"].intValue
        self.name = json["presentation"].stringValue
        self.value = json["value"].stringValue
    }
}
