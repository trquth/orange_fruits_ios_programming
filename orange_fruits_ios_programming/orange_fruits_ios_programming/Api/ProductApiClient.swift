//
//  ProductApiClient.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/18/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProductApiClient: BaseApiClient {
    
    static func products(_ data: URLRequestParams, success: @escaping ([Product]) -> Void, failure: @escaping (ApiError) -> Void ) {
        Alamofire.request(Router.products(data: data))
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(data: response.data!)
                    
                    var products = [Product]()
                    for productJSON in json["products"].arrayValue {
                        let product = Product(fromJSON: productJSON)
                        products.append(product)
                    }
                    
                    success(products)
                case .failure(_):
                    let apiError = ApiError(response: response)
                    failure(apiError)
                }
        }
    }
    
    static func product(_ id: Int, success: @escaping (Product) -> Void, failure: @escaping (ApiError) -> Void) {
        Alamofire.request(Router.product(id: id))
            .validate()
            .responseJSON{ response in
                switch response.result {
                case .success:
                    let json = JSON(data: response.data!)
                    let product = Product(fromJSON: json["product"])
                    
                    for reviewJSON in json["reviews"].arrayValue {
                        let review = ProductReview(fromJSON: reviewJSON)
                        product.reviews.append(review)
                    }
                    
                    success(product)
                case .failure(_):
                    let apiError = ApiError(response: response)
                    failure(apiError)
                }
        }
    }
}

