//
//  OrdersApiClient.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/27/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class OrdersApiClient: BaseApiClient {
    
    static func createOrder(_ success : @escaping (Order) -> Void, failure: @escaping (ApiError) -> Void){
        var data = URLRequestParams();
        data["order[line_items][]"] = nil
        
        Alamofire.request(Router.createOrder(data: data))
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success :
                    let json = JSON(data: response.data!)
                    let order = Order(fromJSON: json)
                    success(order)
                case .failure(_) :
                    let apiError = ApiError(response: response)
                    failure(apiError)
                }
        }
    }
    
    
}
