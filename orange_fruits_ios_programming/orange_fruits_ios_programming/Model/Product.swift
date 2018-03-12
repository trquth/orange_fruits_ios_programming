//
//  Product.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/12/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

public enum ProductRating{
    case unrated
    case avarage
    case ok
    case good
    case brilliant
}

class Product {
    var title : String
    var description : String
    var image : UIImage
    var rating : ProductRating
    
    init(titled : String, description : String, imageName : String) {
        title = titled
        self.description = description
        if let img = UIImage(named : imageName) {
            image = img
        }else{
            image = UIImage(named : "default")!
        }
        rating = .unrated
    }
}
