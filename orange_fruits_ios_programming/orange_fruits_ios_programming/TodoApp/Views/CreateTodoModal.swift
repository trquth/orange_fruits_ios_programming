//
//  CreateTodoModal+Extension.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/23/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class CreateTodoModal : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   func  addNewTodo()  {
    let addAlert = UIAlertController(title: "New Todo", message: "Enter title", preferredStyle: .alert)
    
    addAlert.addTextField(configurationHandler: {
        textField in textField.placeholder = "Todo Item Title"
    })
    
    addAlert.addAction(UIAlertAction(title: "Create", style: .default, handler:{action in
        guard let title = addAlert.textFields?.first?.text else {
            return
        }
        
    }))
    
    if var topController = UIApplication.shared.keyWindow?.rootViewController{
        while let presentedViewController  = topController.presentedViewController{
            topController = presentedViewController
        }
        topController .present(addAlert, animated: true, completion: nil)
    }
    }
}
