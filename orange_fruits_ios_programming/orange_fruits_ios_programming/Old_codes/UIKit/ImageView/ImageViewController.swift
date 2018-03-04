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
    
    let firstImageView : UIImageView = {
        let imageView  = UIImageView(frame: CGRect(x: 10, y: 100, width: 200, height: 200))
        
        imageView.backgroundColor = .yellow
        imageView.image = UIImage(named: "justdontdoit")
        imageView.contentMode = .scaleAspectFit
        
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let secondImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "turnoff"), highlightedImage: #imageLiteral(resourceName: "turnon"))
        
        imageView.frame = CGRect(x: 10, y: 320, width: 100, height: 100)
        imageView.backgroundColor = .green
        imageView.contentMode = .center
        
        imageView.isHighlighted = true
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let thirdImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "turnon"))
        
        imageView.frame = CGRect(x: 10, y: 440, width: 100, height: 100)
        imageView.backgroundColor = .orange
        imageView.contentMode = .center
        
        imageView.animationDuration = 1
        imageView.animationRepeatCount = 0
        imageView.animationImages = [UIImage(named : "turnoff")!, UIImage(named : "turnon")!]
        imageView.startAnimating()
        
        return imageView
    }()
    
    func setupView()  {
        view.addSubview(firstImageView)
        firstImageView.center = CGPoint(x: view.bounds.width / 2 , y: 200)
        view.addSubview(secondImageView)
        view.addSubview(thirdImageView)
        thirdImageView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        
    }
}
