//
//  TodoModel.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/5/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation

class TodoModelWithInit {
    var id: Int?
    var title : String
    var userId : Int
    var completed : Int
    
    init?(_ json : [String : Any]) {
        guard let title = json["title"] as? String,
            let id = json["id"] as? Int,
            let userId = json["userId"] as? Int,
            let completed = json ["completed"] as? Int else{
                return nil
        }
        
        self.id = id
        self.title = title
        self.userId = userId
        self.completed = completed
    }
    
}
