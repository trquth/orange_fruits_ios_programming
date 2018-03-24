//
//  LineItem.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/22/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import SwiftyJSON

class LineItem: NSObject, NSCoding {
    var id: Int?
    var name: String?
    var qty: Int?
    var price: String?
    var imageURL: String?
    
    init(fromJSON json: JSON) {
        self.id = json["id"].intValue
        self.name = json["variant"]["name"].stringValue
        self.qty = json["quantity"].intValue
        self.price = "$" + json["total"].stringValue
        
        if let image = json["variant"]["images"].arrayValue.first {
            self.imageURL = image["small_url"].stringValue
        }
    }
    
    // Mark :- NSCoding
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        qty = aDecoder.decodeObject(forKey: "qty") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        price = aDecoder.decodeObject(forKey: "price") as? String
        imageURL = aDecoder.decodeObject(forKey: "imageURL") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(qty, forKey: "qty")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(imageURL, forKey: "imageURL")
    }
    
}

