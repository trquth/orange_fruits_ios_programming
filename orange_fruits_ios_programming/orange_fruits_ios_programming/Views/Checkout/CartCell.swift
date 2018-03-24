//
//  CartCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

protocol CartCellDelegate {
    func removeLineItem(id: Int)
    func changeQtyOfLineItem(id: Int, to qty: Int)
}

class CartCell: UITableViewCell {

    let minQty = 1
    let maxQty = 20
    
    var currentQty = 0
    
    var delegate: CartCellDelegate?
    
    var downloadTask: URLSessionDownloadTask?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var incrementQty: UIButton!
    @IBOutlet weak var decrementQty: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        downloadTask?.cancel()
        downloadTask = nil
        
        nameLabel.text = nil
        qtyLabel.text = nil
        priceLabel.text = nil
        thumbImageView.image = nil
    }
    
    @objc func remove() {
        delegate?.removeLineItem(id: tag)
    }
    
    @objc func increaseQty() {
        delegate?.changeQtyOfLineItem(id: tag, to: currentQty + 1)
    }
    
    @objc func decreaseQty() {
        delegate?.changeQtyOfLineItem(id: tag, to: currentQty - 1)
    }
    
    func configure(forLineItem lineItem: LineItem) {
        self.tag = lineItem.id!
        
        self.nameLabel.text = lineItem.name
        
        setQty(lineItem.qty!)
        
        self.priceLabel.text = lineItem.price
        
        if let urlString = lineItem.imageURL, let url = URL(string: urlString) {
            downloadTask = self.thumbImageView.loadImageWithURL(url)
        }
        
        removeButton.addTarget(self, action: #selector(remove), for: .touchUpInside)
        
        incrementQty.addTarget(self, action: #selector(increaseQty), for: .touchUpInside)
        
        decrementQty.addTarget(self, action: #selector(decreaseQty), for: .touchUpInside)
    }
    
    private
    
    func setQty(_ qty: Int) {
        currentQty = qty
        
        self.qtyLabel.text = "\(qty)"
        
        if qty == minQty {
            incrementQty.isEnabled = true
            decrementQty.isEnabled = false
        } else if qty == maxQty {
            incrementQty.isEnabled = false
            decrementQty.isEnabled = true
        } else {
            incrementQty.isEnabled = true
            decrementQty.isEnabled = true
        }
    }
}
