//
//  ProductTableViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/12/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {

    lazy var productLines : [ProductLine] = {
        return ProductLine.productLines()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        navigationItem.rightBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return productLines.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return productLines[section].name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productLines[section].products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Product Cell", for: indexPath) as! ProductTableViewCell
        let product = productLines[indexPath.section].products[indexPath.row]
        
        cell.configureCellWith(product)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            productLines[indexPath.section].products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let productToMove = productLines[sourceIndexPath.section].products[sourceIndexPath.row]
        
        productLines[destinationIndexPath.section].products.insert(productToMove, at: destinationIndexPath.row)
        
        productLines[sourceIndexPath.section].products.remove(at: sourceIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Show Edit" :
                let editTableVC = segue.destination as! EditProductTableViewController
                if let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell){
                    editTableVC.product = productLines[indexPath.section].products[indexPath.row]
                }
                
            default:
                break
            }
        }
    }
}
