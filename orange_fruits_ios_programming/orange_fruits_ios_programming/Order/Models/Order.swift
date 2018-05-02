//
//  Order.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/27/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import SwiftyJSON

class Order: NSObject , NSCoding {
    
    enum State {
        case cart
        case address
        case payment
        case complete
    }
    
    var id : String!
    var state : State = .cart
    var date : String!
    var item_total : String!
    var shipment_total : String!;
    var tax_total : String!
    var promo_total : String!
    var total : String!
    
    var lineItems = [LineItem]()
    
    var itemsCount : Int {
        return lineItems.count
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(total, forKey: "total")
        aCoder.encode(lineItems, forKey: "lineItems")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: "id") as? String
        date = aDecoder.decodeObject(forKey: "date") as? String
        total = aDecoder.decodeObject(forKey: "total") as? String
        lineItems = aDecoder.decodeObject(forKey: "lineItems") as! [LineItem]
    }
    
    init(fromJSON json : JSON) {
        self.id = json["id"].stringValue
        self.date = json["completed_at"].stringValue
        self.item_total = json["item_total"].stringValue
        self.shipment_total = json["shipment_total"].stringValue
        self.tax_total = json["additional_tax_total"].stringValue
        self.promo_total = json["promo_total"].stringValue
        self.total = json["total"].stringValue
        
        for lineItemJSON in json["line_items"].arrayValue {
            let lineItem = LineItem(fromJSON: lineItemJSON)
            self.lineItems.append(lineItem)
        }
        
        switch json["state"].stringValue {
        case "address":
            self.state = .address
        case "payment":
            self.state = .payment
        case "complete":
            self.state = .complete
        case "address":
            self.state = .address
        default:
            self.state = .cart
        }
    }
    
    init(fromDic dic: [String : Any]) {
        let lineItem = LineItem(fromDic: dic)
        self.lineItems.append(lineItem)
    }
    
    static var _currentOrder : Order!
    
    static var currentOrder : Order? {
        get {
            if (_currentOrder != nil){
                return _currentOrder
            }else{
                let defaults = UserDefaults.standard
                if let unarchivedObject = defaults.object(forKey: "currentOrder") as? NSData {
                    _currentOrder = NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? Order
                    return _currentOrder
                }
            }
            return nil
        }
    
        set {
            _currentOrder = newValue
            let defaults = UserDefaults.standard
            
            if let order = newValue {
                let archivedObject = NSKeyedArchiver.archivedData(withRootObject: order)
                defaults.set(archivedObject, forKey: "currentOrder")
            }else{
                defaults.removeObject(forKey: "currentOrder")
            }
        }
    }
    
    static var hasCurrentOrder : Bool {
        return currentOrder != nil && currentOrder!.id != ""
    }
    
    var isEmpty : Bool {
        return lineItems.count == 0
    }
   
    
}
