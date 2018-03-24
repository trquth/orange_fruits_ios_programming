//
//  PageApiClient.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/19/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PageApiClient: BaseApiClient {
    
    static func home(_ success: @escaping (HomePage) -> Void, failure: @escaping (ApiError) -> Void ){
        Alamofire.request(Router.home)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(data: response.data!)
                    let home = HomePage()
                    
                    home.prepareDate(json["banner_types"])
                    
                    success(home)
                case .failure(_):
                    let apiError = ApiError(response: response)
                    failure(apiError)
                }
        }
    }
    
}

