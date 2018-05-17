//
//  OrderService.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 5/5/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import RealmSwift

enum UpdateType : Int {
    case Increase = 1
    case Decrease = 0
}

class OrderService {
    
    init() {}
    static let shared = OrderService()
    var realm = try! Realm()
    
    func addProductToCart(_ product : OrderModel, complete : (() -> ())?) {
        do {
            try realm.write {
                realm.add(product)
                if let handler = complete {
                    handler()
                }
            }
        } catch  {
            print("Can't add product to card")
        }
    }
    
    func updateQuantityProductOfCart(_ obj: OrderModel,type: UpdateType, complete : (() ->())?) {
        do {
            try realm.write {
               type == UpdateType.Increase ?  (obj.quantity += 1) : (obj.quantity -= 1)
                if(obj.quantity < 1000 && obj.quantity > 0){
                    realm.add(obj, update: true)
                }
                
                if let handler = complete {
                    handler()
                }
            }
        } catch  {
            print("Having error during update data")
        }
    }
    
    func getAllProductsInCart() -> Results<OrderModel>{
         return realm.objects(OrderModel.self)
    }
    
    func getProductInCart(_ name : String, complete : ((OrderModel?) -> ())?) -> OrderModel? {
        let predicate = NSPredicate(format: "productName = %@", name)
        let result = realm.objects(OrderModel.self).filter(predicate).first as? OrderModel
        
        guard let callback = complete else {
            return result
        }
        
        callback(result)
        
        return result
    }
}
