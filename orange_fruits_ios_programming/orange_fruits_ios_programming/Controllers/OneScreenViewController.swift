//
//  OneScreenViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/14/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class OneScreenViewController: UIViewController {

    @IBOutlet weak var fourFiveSwitch : UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goButton(_ sender: Any) {
        if !fourFiveSwitch.isOn {
            performSegue(withIdentifier: "showFourScreen", sender: self)
        }else{
            performSegue(withIdentifier: "showFiveScreen", sender: self)
        }
    }
    

    @IBAction func modalTwoButton(_ sender: Any) {
        
        let twoVC = TwoScreenViewController(nibName: "TwoScreenView", bundle: nil)
//        present(twoVC, animated: true, completion: nil)
        
        navigationController?.pushViewController(twoVC, animated: true)
    }
}
