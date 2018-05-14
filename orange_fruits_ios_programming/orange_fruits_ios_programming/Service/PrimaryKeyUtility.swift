//
//  PrimaryKeyUltil.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 5/14/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import RealmSwift

class PrimaryKeyUtility {
    
    private init(){}
    static let sharedInstance = PrimaryKeyUtility()
    let realm = try! Realm()
    
    func generatePrimaryKey<T: Object>(_ obj : T.Type) -> Int {
        return (realm.objects(obj).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
}
