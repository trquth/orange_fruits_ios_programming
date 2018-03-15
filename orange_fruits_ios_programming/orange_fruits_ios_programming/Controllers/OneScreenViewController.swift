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
    
    @IBAction func sixNavigationButton(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SixScreen" )else{
            print("View controller Six not found")
            return
        }
//        navigationController?.pushViewController(SixScreenViewController(), animated: true)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sixModalButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SixScreen" )else{
            print("View controller Six not found")
            return
        }
//        present(SixScreenViewController(), animated: true, completion: nil)
        present(vc, animated: true, completion: nil)
    }
}
