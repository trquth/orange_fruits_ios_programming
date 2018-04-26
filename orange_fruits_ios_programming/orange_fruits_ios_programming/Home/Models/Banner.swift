//
//  Banner.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/26/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation

import SwiftyJSON

class Banner {
    var id: Int?
    var name: String?
    var displayName: String?
    var imageURLs = [String]()
    
    init(fromJSON json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.displayName = json["presentation"].stringValue
        
        for banner in json["banners"].arrayValue {
            let imageURL = banner["image_url"].stringValue
            self.imageURLs.append(imageURL)
        }
    }
}

class BannerModel {
    var id: Int?
    var name: String?
    var displayName: String?
    var imageURLs = [String]()
}
