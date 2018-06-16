//
//  PreferencesTableViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 6/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

enum PrefRowIdentifier : String {
    case AutoRefresh = "Auto Refresh"
    case PlaySounds  = "Play Sounds"
    case ShowPhotos = "Show Photos"
}

class PreferencesViewController: UIViewController {
    
    let cellId = "PreferenceTableCell"
    
    let tableStructure : [[PrefRowIdentifier]] = [[.AutoRefresh],
                                                  [.PlaySounds],
                                                  [.ShowPhotos]]
    
    var prefValues : [PrefRowIdentifier : Bool] = [:]
    
    var currentPrefs : Preferences! {
        didSet {
            prefValues[.AutoRefresh] = currentPrefs.autoRefresh
            prefValues[.PlaySounds] = currentPrefs.playSounds
            prefValues[.ShowPhotos] = currentPrefs.showPhotos
            preferentcesTable.reloadData()
        }
    }
    
    var delegate :  FormViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(didSavePreferences))
        
        view.addSubview(preferentcesTable)
        let views = ["v1" : preferentcesTable]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics:nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
       
        preferentcesTable.register(PreferenceTableCell.self, forCellReuseIdentifier: cellId)
        preferentcesTable.delegate = self
        preferentcesTable.dataSource = self
        currentPrefs = currentPrefs ?? Preferences()
        
        
    }
    
    
    let preferentcesTable : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func preferencesFromTableData() -> Preferences {
        let ret = Preferences()
        ret.autoRefresh = prefValues[.AutoRefresh] ?? ret.autoRefresh
        ret.playSounds = prefValues[.PlaySounds] ?? ret.playSounds
        ret.showPhotos = prefValues[.ShowPhotos] ?? ret.showPhotos
        return ret
    }
    
   @objc func didSavePreferences() {
     self.preferencesFromTableData()
    }
}

extension PreferencesViewController : UITableViewDelegate, UITableViewDataSource, PreferenceSwitchCellDelegate {
    
    func preferenceSwitchCellDidToggle(cell: PreferenceTableCell, newValue: Bool) {
        prefValues[cell.prefRowIndentifier] = newValue
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableStructure.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PreferenceTableCell
        
        cell.delegate = self
        let prefRowIdentifer = tableStructure[indexPath.row][0]
        cell.switchBtn.isOn = prefValues[prefRowIdentifer]!
        cell.prefRowIndentifier = prefRowIdentifer
        
        return cell
    }

}



