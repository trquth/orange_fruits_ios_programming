//
//  ApiError.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/26/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Alamofire
import SwiftyJSON

class ApiError {
    var response: HTTPURLResponse?
    var json: JSON?
    
    init(response: DataResponse<Any>) {
        self.response = response.response
        
        if let data = response.data {
            self.json = JSON(data: data)
        }
    }
    
    func errorMessage() -> String {
        var errorMessage = ""
        
        print("***** Error: ")
        print(response)
        
        if let errors = json?["errors"] , errors.count != 0 {
            for (field, messages):(String, JSON) in errors {
                let key = field.titleize
                
                for message in messages.arrayValue {
                    errorMessage += "\(key) \(message.stringValue)\n"
                }
            }
        } else if let message = json?["message"] , !message.isEmpty {
            errorMessage = message.stringValue
        } else {
            errorMessage = "Some error occurred. Please try again."
        }
        
        return errorMessage
    }
    
}

