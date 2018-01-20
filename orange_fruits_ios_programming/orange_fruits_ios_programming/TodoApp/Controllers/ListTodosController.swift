//
//  ListTodosController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/17/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ListTodosController : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let footerId = "FooterTodoTable"
    
    var mainTableView : UITableView!
    var mainArray : NSMutableArray!
    
    override func viewDidLoad() {
        
        navigationItem.title = "Todos"
        
        showAllFonts()
        setupViews()
    }
    
    func setupViews() {
        mainTableView = UITableView(frame: .zero, style: .plain)
        
        view.addSubview(mainTableView)
        view.backgroundColor = .red
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        mainTableView.sectionFooterHeight = 80
        
        mainTableView.backgroundColor = UIColor.clear
        
        mainTableView.isScrollEnabled = true
        
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        mainTableView.register(FooterTodoTableView.self, forHeaderFooterViewReuseIdentifier: footerId)
        
        let views = ["v1" : mainTableView] as [String: Any]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
       view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: views))
        
        
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
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
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerId)
        return footer
    }
    
    func showAlert(_ messsage: String)  {
        let alertView = UIAlertView(title: "Alert", message: messsage, delegate: nil, cancelButtonTitle: "OK")
        alertView.show()
    }
    
}
