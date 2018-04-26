//
//  HomePage.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/26/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import SwiftyJSON

class HomePage {
    
    enum Section {
        case promoOffers
        case brandOffers
        case categoryOffers
        case newArrivals
    }
    
    var data = [Section: Banner]()
    
    func prepareDate(_ json: JSON) {
        
        for bannerJSON in json.arrayValue {
            let banner = Banner(fromJSON: bannerJSON)
            
            switch banner.name! {
            case "promo_offer_banner":
                data[.promoOffers] = banner
            case "brand_offer_banner":
                data[.brandOffers] = banner
            case "category_offer_banner":
                data[.categoryOffers] = banner
            case "new_arrival_banner":
                data[.newArrivals] = banner
            default:
                print("Banner: \(banner)")
            }
        }
    }
    
}

