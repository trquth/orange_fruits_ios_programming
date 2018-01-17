//
//  CallAPIWithoutThirdPartyHelper.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/24/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import Foundation

class CallingAPIWithoutThirdPartyHelper {
    
    fileprivate static let rootApi = "http://jsonplaceholder.typicode.com/"
    
    static  func getListPosts(){
        
        guard let url = URL(string: "\(rootApi)posts") else {
            print("URL is invalid")
            return
        }
        
        let request = MutableURLRequest(url: url)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            guard error == nil else {
                print("Error with \(error)")
                return
            }
            
            guard let responseData = data else {
                print("Don't receive data")
                return
            }
            do{
                guard let data = try JSONSerialization.jsonObject(with: responseData, options: []) as? [Any] else {
                    print("Error when try to convert data to JSON")
                    return
                }
                print("JSON Data \(data)")
            }catch{
                print("Some problems happen when convert data to JSON")
                return
            }
        })
        
        task.resume()
    }
}
