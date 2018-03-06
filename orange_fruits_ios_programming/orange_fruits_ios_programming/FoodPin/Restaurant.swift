//
//  Restaurant.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/6/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation

class Restaurant {
    
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        
    }
}
