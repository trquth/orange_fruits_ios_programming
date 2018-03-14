//
//  SixScreenViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/14/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class SixScreenViewController: UIViewController {

    
    @IBAction func backButton(_ sender: Any) {
        guard navigationController?.popViewController(animated: true) != nil else {
            print("No Navigation Controller")
            return
        }
    }
    
    @IBAction func rootButton(_ sender: Any) {
        guard navigationController?.popToRootViewController(animated: true) != nil else{
            print("No Navigation Controller")
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
