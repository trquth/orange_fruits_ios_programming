//
//  MenuViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/10/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    let titleNav = "Menu"
    let menuView = MenuTableView()
    let menuTableCellId = "MenuTableCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItem()
        
        navigationItem.title = titleNav
        
        menuView.menuTableView.register(MenuTableCellView.self, forCellReuseIdentifier: menuTableCellId)
        menuView.menuTableView.delegate = self
        menuView.menuTableView.dataSource = self
        
    }
    
    override func loadView() {
        view = menuView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setStatusBarColor(UIBarStyle.default)
    }
}

extension MenuViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuTableCellId, for: indexPath) as! MenuTableCellView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 5
    }
    
    
}
