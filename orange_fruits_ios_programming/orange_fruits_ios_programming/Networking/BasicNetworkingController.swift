//
//  BasicNetworkingController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 12/19/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class BasicNetworkingController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let cellId = "basicNetworkingCellId"
    
    var array: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Basic Networking"
        
        array = ["GET without parameter" , "GET with parameters", "POST without parameter", "POST with parameter", "DELEGATE"]
        
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        setupView()
        
        requestWithParameter()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor =  UIColor.lightGray
        self.edgesForExtendedLayout = []
    }
    
    let mainTableView : UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    func setupView()  {
        mainTableView.frame = view.bounds
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        view.addSubview(mainTableView)
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = array[indexPath.row] as! String
        
        return cell
    }
    
    func requestWithParameter(){
        let url = URL(string: "http://jsonplaceholder.typicode.com/posts/1")!
        let request = MutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(Constants.accessToken)", forHTTPHeaderField: "Authorization")
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        //let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            guard error == nil else {
                print("With error \(error)")
                return
            }
            
            guard let responseData = data else {
                print("Don't receive data")
                return
            }
            
            do {
                guard let data = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    print("Error when try to convert data to JSON")
                    return
                }
                print("Data \(data)")
            } catch {
                print("Some problems happen when convert data to JSON")
                return
            }
        })
        
        task.resume()
        
    }
    
    
}
