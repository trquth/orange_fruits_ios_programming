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
    
    func updateProductQuantity(_ id: Int,_ type: UpdateType, complete :@escaping () -> ()) {
        do {
            try realm.write {
                var obj = realm.objects(OrderModel.self).filter(NSPredicate(format: "id == %d", id)).first as? OrderModel
                if let model = obj {
                    
                    switch type {
                        case .Increase : if(model.quantity < 1000){ model.quantity += 1}
                        case .Decrease : if(model.quantity > 0){ model.quantity -= 1}
                        default : print("Can't update product quantity")
                    }
                        
                    if(model.quantity < 1000 && model.quantity > 0){
                        type == UpdateType.Increase ?  () : ()
                        realm.add(model, update: true)
                    }
                      complete()
                }
              
            }
        } catch  {
            print("Having error during update data")
        }
    }
    
    func getAllProductsInCart() -> [OrderModel]{
         return realm.objects(OrderModel.self).toArray(ofType: OrderModel.self)
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
