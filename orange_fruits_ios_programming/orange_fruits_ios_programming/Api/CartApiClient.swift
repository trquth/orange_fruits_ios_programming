//
//  CartApiClient.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/27/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Alamofire
import SwiftyJSON

class  CartApiClient: BaseApiClient {
    
    static func addLineItem(_ orderId : String, data : URLRequestParams,
                            success: @escaping (Order) -> Void, failure : @escaping (ApiError) -> Void ){
        Alamofire.request(Router.addItem(order_id: orderId, data: data))
            .validate()
            .responseJSON {
                response in
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
    
    static func addLineItemMode(_data : Order,
                            success: @escaping () -> Void, failure : @escaping (ApiError) -> Void ){
        success()
    }
}
