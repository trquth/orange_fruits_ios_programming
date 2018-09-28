//
//  HomeViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 9/28/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
        button.setIconImage(withIcon: ._384Icon, size: CGSize(width: 44, height: 44), color: nil, forState: .normal)
        self.view.addSubview(button)

    }
    


}
