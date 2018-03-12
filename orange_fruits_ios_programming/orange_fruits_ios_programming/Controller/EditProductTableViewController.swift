//
//  EditProductTableViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/12/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class EditProductTableViewController: UITableViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UITextField!
    @IBOutlet weak var productDescriptionLabel: UITextView!
    
    var product : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Product"
        
        productImageView.image = product?.image
        productTitleLabel.text = product?.title
        productDescriptionLabel.text = product?.description
    }

}
