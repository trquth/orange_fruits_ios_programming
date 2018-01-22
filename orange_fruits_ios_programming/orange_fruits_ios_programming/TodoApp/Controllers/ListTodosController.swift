//
//  ListTodosController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/17/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ListTodosController : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private let footerId = "FooterTodoTable"
    private let headerId = "HeaderTodoTable"
    private let customHeaderId = "CustomHeaderId"
    
    var mainArray : NSMutableArray!
    
    override func viewDidLoad() {
    
        showAllFonts()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        UIApplication.shared.isStatusBarHidden = true
    }
    
    let mainTableView : UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.isScrollEnabled = true
        table.showsVerticalScrollIndicator = false
        
        table.backgroundColor = UIColor.clear
        //table.sectionFooterHeight = 80
        //mainTableView.sectionHeaderHeight = 100
        
        return table
    }()
    
    let customHeaderView : CustomHeaderView = {
        let header = CustomHeaderView(frame: .zero)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        return header
    }()
    
    let customFooterView : CustomFooterView = {
        let footer = CustomFooterView(frame: .zero)
        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
    }()
    
    func setupViews() {
        view.backgroundColor = .red
        
        view.addSubview(mainTableView)
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        //mainTableView.register(FooterTodoTableView.self, forHeaderFooterViewReuseIdentifier: footerId)
        //mainTableView.register(HeaderTodoTableView.self, forHeaderFooterViewReuseIdentifier: headerId)
        
        view.addSubview(customHeaderView)
        view.addSubview(customFooterView)
        
        let views = ["v1" : mainTableView,
                     "v2" : customHeaderView,
                     "v3" : customFooterView]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2][v1][v3(80)]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v2]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v3]|", options: [], metrics: nil, views: views))
        
        view.addConstraint(NSLayoutConstraint(item: customHeaderView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 90))
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
    
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerId)
    //        return footer
    //    }
    
    //        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId)
    //            return header
    //        }
    
    func showAlert(_ messsage: String)  {
        let alertView = UIAlertView(title: "Alert", message: messsage, delegate: nil, cancelButtonTitle: "OK")
        alertView.show()
    }
    
}
