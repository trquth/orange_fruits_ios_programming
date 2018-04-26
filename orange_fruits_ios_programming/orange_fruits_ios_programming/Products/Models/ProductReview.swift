//
//  ProductReview.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/18/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import SwiftyJSON

class ProductReview {
    var id: Int?
    var userId: Int?
    var userName: String?
    var title: String?
    var rating: Int?
    var review: String?
    
    init(fromJSON json: JSON) {
        self.id = json["id"].intValue
        self.userId = json["user_id"].intValue
        self.userName = json["name"].stringValue
        self.title = json["title"].stringValue
        self.rating = json["rating"].intValue
        self.review = json["review"].stringValue
    }
    
}
