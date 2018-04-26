//
//  ImageGallery.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/19/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ImageGallery : UIView, UIScrollViewDelegate {
    
    var downloadTask: URLSessionDownloadTask?

    var listImageUrls : [String] = [] {
        didSet {
            showImages(listImageUrls)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpConstraintViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let productImagesScrollView : UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.isPagingEnabled = true
        
        scrollView.contentInset = UIEdgeInsets.zero
        
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero;
        
        return scrollView
    }()
    
    let productImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    func setUpConstraintViews() {
        addSubview(productImagesScrollView)
        
        let views = ["v1" : productImagesScrollView]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v1]-5-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v1]-5-|", options: [], metrics: nil, views: views))
        
        
    }
    
    func showImages(_ listImages : [String]){
        
        var viewDict = [String : UIView]()
        viewDict["superview"] = productImagesScrollView
        
        var horizontal_constraints = "H:|"
        
        for (index, item) in listImages.enumerated() {
            let subView = UIImageView()
            subView.translatesAutoresizingMaskIntoConstraints = false
            
            if  let url = URL(string: item) {
                downloadTask = subView.loadImageWithURL(url)
            } else {
                subView.image = UIImage(named: "Product")
            }
            
            
            viewDict["subview_\(index)"] = subView
            productImagesScrollView.addSubview(subView)
            horizontal_constraints += "[subview_\(index)(==superview)]"
            productImagesScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview_\(index)(==superview)]|", options: [], metrics: nil, views: viewDict))
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview_1(==superview)]|", options: [], metrics: nil, views: viewDict))
        horizontal_constraints += "|"
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat : horizontal_constraints, options: [.alignAllTop, .alignAllBottom], metrics: nil, views: viewDict))
    }
    
    
    
}
