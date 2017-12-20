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
        let url: NSURL = NSURL(string: "\(Constants.twitterUrl)followers/list.json")!
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        
        request.httpMethod = "GET"
        
        request.addValue("KvAiQvPTbcDe1LHUXpPasGxkx", forHTTPHeaderField: "Consumer Key")
        request.addValue("KZU4ur3UKhK9ns4QWURw4LwnkoQr2j80frRDBd9rc951LNEvZv", forHTTPHeaderField: "Consumer Secret")
        request.addValue("707505086247804929-K8SeCIaCCzzB76WrcevKpCLQ551gXQr", forHTTPHeaderField: "Access Token")
        request.addValue("rEwMv7hoNMGN8500ZbHyuoSuxs7SP4bO0farGAvzW0LQY", forHTTPHeaderField: "Token Secret")
        
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: configuration)
        
        let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: {
            (data,response, error) -> Void in
            if error == nil{
                
            }
        })
        
        task.resume()
        
    }
    
    
}
