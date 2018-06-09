//
//  ItemCartCollectionViewCell.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 5/17/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

protocol CartCellDelegate {
    func updateQty(_ id: Int,_ type: UpdateType,  complete : @escaping () -> ())
}

class ItemCartCollectionViewCell: UICollectionViewCell {
    
    var delegate : CartCellDelegate?
    
    var model : OrderModel? {
        didSet{
            if let id = model?.id {
                self.tag = id

            }
            thumbnailImage.image = UIImage(named: "Product")
            productNameLabel.text = model?.productName
            if let quantity = model?.quantity {
                  qtyValueLabel.text = String(describing : quantity)
            }
            if let totalPriceValue = model?.price {
                totalPrice.text = String(describing : totalPriceValue)
            }
            increaseButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
            decreaseButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
          
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    override func layoutSubviews() {
        let borderBottom = CALayer()
        let borderTop = CALayer()
        //bottom
        borderBottom.frame = CGRect(x: 0 , y: self.frame.width - 1 , width: self.frame.width, height: 1)
        self.layer.addSublayer(borderBottom)
        //top
        borderTop.frame = CGRect(x: 0, y: 0, width: self.frame.width - 1, height: 1)
        borderTop.backgroundColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(borderTop)
    }
    
    @objc func increaseQuantity(){
        
        delegate?.updateQty(tag, .Increase ){
            print("Increase Quantity")
        }
    }
    
    @objc func decreaseQuantity(){
        delegate?.updateQty(tag, .Decrease ){
            print("Decrease Quantity")
        }
    }
    
   lazy var thumbnailImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        imageView.backgroundColor = .gray
        return imageView
    }()
    
     lazy var productNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Loading..."
        return label
    }()
    
     lazy var qtyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Qty:"
        label.textColor = UIColor.black
        
        return label
    }()
    
     lazy var qtyValueLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Loading"
        return label
    }()
    
     lazy var totalPrice : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Loading"
        return label
    }()
    
     lazy var increaseButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(#imageLiteral(resourceName: "Increment"), for: .normal)
        
        return button
    }()
    
     lazy var decreaseButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(#imageLiteral(resourceName: "Decrement"), for: .normal)
        
        return button
    }()
    
     lazy var removeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(#imageLiteral(resourceName: "Remove"), for: .normal)
        
        return button
    }()
    
    func setUpViews() {
        addSubview(thumbnailImage)
        addSubview(productNameLabel)
        addSubview(qtyLabel)
        addSubview(increaseButton)
        addSubview(qtyValueLabel)
        addSubview(decreaseButton)
        addSubview(totalPrice)
        addSubview(removeButton)
        
        let views : [String : Any] = ["v1": thumbnailImage,
                     "v2": productNameLabel,
                     "v3": qtyLabel,
                     "v4": increaseButton,
                     "v5": qtyValueLabel,
                     "v6": decreaseButton,
                     "v7": totalPrice,
                     "v8": removeButton]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v1(80)]-[v2]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1(80)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v1(80)]-[v3]-25-[v4(20)]-15-[v5]-15-[v6(20)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v3]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v4(20)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v5]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v6(20)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v1(80)]-[v7]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v7][v8(20)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v3]-10-[v8(20)]", options: [], metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2]-10-[v3]-10-[v7]", options: [], metrics: nil, views: views))

        thumbnailImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thumbnailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        
        qtyLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        increaseButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        qtyValueLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        decreaseButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        removeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
}
