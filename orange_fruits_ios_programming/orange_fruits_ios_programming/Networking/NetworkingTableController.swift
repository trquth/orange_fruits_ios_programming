//
//  NetworkingTableController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 12/19/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class NetworkingTableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let cellId = "tableViewCellId"
    
    var array: NSArray!
    var data: NSMutableData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Networking"
        
        array = ["NSURL", "NSURLRequest", "NSURLConnection", "NSURLSessionDataTask", "Alamofire"]
        
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        setupViews()
        
    }
    
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor.lightGray
        
        self.edgesForExtendedLayout = []
    }
    
    func setupViews(){
        mainTableView.frame = view.bounds
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        view.addSubview(mainTableView)
        
        
    }
    
    let mainTableView : UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = array[indexPath.row] as! String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(BasicNetworkingController(), animated: true)
    }
}
