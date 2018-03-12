//
//  ProductTableViewCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/12/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescriptionLable: UILabel!
    @IBOutlet weak var productTitleLable: UILabel!
    
    func configureCellWith(_ product : Product){
        productImageView.image = product.image
        productTitleLable.text = product.title
        productDescriptionLable.text = product.description
    }

}
