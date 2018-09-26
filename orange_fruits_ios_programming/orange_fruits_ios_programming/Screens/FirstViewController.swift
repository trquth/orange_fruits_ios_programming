//
//  FirstViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 7/14/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        
        let menuBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        menuBtn.setImage(UIImage(named: "drawmenuicon")?.withRenderingMode(.alwaysOriginal), for: UIControlState.normal)
        menuBtn.setImage(UIImage(named: "drawmenuicon"), for: UIControlState.highlighted)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
