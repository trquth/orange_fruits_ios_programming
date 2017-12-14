//
//  ImageViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 12/14/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "UIKit - ImageView - IOS"
        view.backgroundColor = .white
        
        setupView()
    }
    
    let imageView : UIImageView = {
        let imageView  = UIImageView(frame: CGRect(x: 10, y: 100, width: 200, height: 200))
        
        imageView.backgroundColor = .yellow
        imageView.image = UIImage(named: "turnon")
        imageView.contentMode = .center
        
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let secondImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "turnoff"), highlightedImage: #imageLiteral(resourceName: "turnon"))
        
        imageView.frame = CGRect(x: 10, y: 320, width: 100, height: 100)
        imageView.backgroundColor = .green
        imageView.isHighlighted = true
        
        return imageView
    }()
    
    func setupView()  {
        view.addSubview(imageView)
        view.addSubview(secondImageView)
    }
}
