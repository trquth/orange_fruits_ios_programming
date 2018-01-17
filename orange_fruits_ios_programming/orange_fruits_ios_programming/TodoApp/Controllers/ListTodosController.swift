//
//  ListTodosController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/17/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ListTodosController : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var mainTableView : UITableView!
    var mainArray : NSMutableArray!
    
    override func viewDidLoad() {
        
        navigationItem.title = "Todos"
        
        showAllFonts()
        setupViews()
    }
    
    func setupViews() {
        mainTableView = UITableView(frame: self.view.bounds, style: .plain)
        view.addSubview(mainTableView)
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        mainTableView.backgroundColor = UIColor.clear
        
        mainTableView.isScrollEnabled = true
        
    }
    
    func showAllFonts() {
        mainArray = NSMutableArray()
        
        let familyFonts = UIFont.familyNames
        
        for font in familyFonts {
            mainArray.add(font)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell");
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "UITableViewCell")
            
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
            
            cell.detailTextLabel?.textColor = UIColor.lightGray
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        }
        
        let fontName: String = mainArray[indexPath.row as Int] as! String
        cell.textLabel?.text = fontName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert("Edit item in row \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete", handler: {
            (action, index) in
            self.showAlert("Delete item in row: \(index.row)")
        })
        delete.backgroundColor = UIColor.red
        
        return [delete]
    }
    
    func showAlert(_ messsage: String)  {
        let alertView = UIAlertView(title: "Alert", message: messsage, delegate: nil, cancelButtonTitle: "OK")
        alertView.show()
    }
    
}
