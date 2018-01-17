//
//  ConvertJSONByBasicWayController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/5/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ConvertJSONByBasicWayController: UIViewController {
    override func viewDidLoad() {
        self.title = "Convert JSON Without Lib"
        
        setupViews()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        self.edgesForExtendedLayout = []
    }
    
    func createButtonWithTitle(_ title: String, withColor color : UIColor) -> UIButton {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        
        return button
    }
    
    func setupViews() {
        let orange = UIColor(red: 249/255, green: 164/255, blue: 37/255, alpha: 1)
        let firstButton = createButtonWithTitle("Convert Simple JSON", withColor: orange)
        firstButton.frame = CGRect(x: 10, y: 10, width: UIScreen.main.bounds.width - 20, height: 40)
        firstButton.addTarget(self, action: #selector(getTodoById(_: )), for: .touchUpInside)
        view.addSubview(firstButton)
    }
    
    @objc func getTodoById(_ sender: UIButton) {
        ConvertJSONByBasicWayController.todoByID(1, completionHandle: {
            (data, error) in
            guard error == nil else {
                print(error)
                return
            }
            guard let receivedData = data else{
                print("Can not receive data")
                return
            }
            
            print(receivedData.title)
            return
        })
    }
    
    static func todoByID(_ id: Int, completionHandle : @escaping (TodoModelWithInit?, String?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/\(id)") else {
            completionHandle(nil, "Could not construct URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            guard error == nil else {
                completionHandle(nil, "No response data")
                return
            }
            guard let dataResponse = data else {
                completionHandle(nil, "No response data")
                return
            }
            
            do{
                if let todoJson = try JSONSerialization.jsonObject(with: dataResponse, options: []) as? [String: Any], let todo = TodoModelWithInit(todoJson){
                    completionHandle(todo, nil)
                }else{
                    completionHandle(nil, "Can't create todo object from JSON")
                }
            }catch{
                completionHandle(nil, "Can not convert data to json")
                return
            }
        })
        task.resume()
    }
}
