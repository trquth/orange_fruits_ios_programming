//
//  LineItem.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/28/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import SwiftyJSON

class LineItem: NSObject, NSCoding {
   
    var id : Int!
    var name : String!
    var qty : Int!
    var price: String!
    var imageUrl : String!
    
    init(fromJSON json: JSON) {
        self.id = json["id"].intValue
        self.name = json["variant"]["name"].stringValue
        self.qty = json["quantity"].intValue
        self.price = "$" + json["total"].stringValue
        
        if let image = json["variant"]["images"].arrayValue.first {
            self.imageUrl = image["small_url"].stringValue
        }
    }
    
    init(fromDic dic : [String : Any]) {
        
        self.id = dic["id"] as? Int
        
        if let variant = dic["variant"] as? NSDictionary{
            self.name = variant["name"]! as? String
            if let images = variant["images"] as? [String]{
                self.imageUrl = images[0]
            }
        }
       
        self.qty = dic["quantity"] as? Int
        self.price = "$+\(String(describing: dic["total"] as? String))"
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(qty, forKey: "qty")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(imageUrl, forKey: "imageUrl")
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        qty = aDecoder.decodeObject(forKey: "qty") as? Int
        price = aDecoder.decodeObject(forKey: "price") as? String
        imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as? String
    }
}
