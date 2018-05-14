//
//  OrderService.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 5/5/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import RealmSwift

class OrderService {
    
    init() {}
    static let shared = OrderService()
    var realm = try! Realm()
    
    func addProductToCart(_ product : OrderModel) {
        do {
            try realm.write {
                realm.add(product)
            }
        } catch  {
            print("Can't add product to card")
        }
    }
    
    func updateQuantityProductInCart(_ obj: OrderModel, quantity: Int) {
        do {
            try realm.write {
                realm.add(obj, update: true)
            }
        } catch  {
            print("Having error during update data")
        }
    }
    
//    func findProductInCart(_ name: String) -> OrderModel {
//        do {
//            try realm.objects(OrderModel).f
//        } catch  {
//            print("Having error during find data")
//        }
//    }
}
