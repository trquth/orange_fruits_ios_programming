//
//  Results.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 6/9/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    
    func toArray<T>(ofType : T.Type) -> [T] {
        
        var array : [T] = []
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}
