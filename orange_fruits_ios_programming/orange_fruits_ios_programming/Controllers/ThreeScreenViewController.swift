//
//  ThreeScreenViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/15/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class ThreeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButton(_ sender: Any) {
        let x = navigationController
        let y = self.navigationController
        let z = self
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rootButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
