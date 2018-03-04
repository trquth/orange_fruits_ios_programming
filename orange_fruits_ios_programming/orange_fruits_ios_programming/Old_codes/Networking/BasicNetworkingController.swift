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
    
    
}
