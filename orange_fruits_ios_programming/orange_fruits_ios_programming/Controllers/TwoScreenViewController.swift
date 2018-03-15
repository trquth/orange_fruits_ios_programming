//
//  TwoScreenViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/15/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class TwoScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButton(_ sender: Any) {
        guard navigationController?.popViewController(animated: true) != nil else {
            print("Not a navigation Controller")
            dismiss(animated: true, completion: nil)
            return
        }
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        let threeVC = ThreeScreenViewController(nibName: "ThreeScreenView", bundle: nil)
        self.navigationController?.pushViewController(threeVC, animated: true)
//        present(threeVC, animated: true, completion: nil)
    }
    
}
