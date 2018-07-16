//
//  BaseViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 7/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit
class BaseViewController: UIViewController{
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        let leftBtn = UIButton(frame:CGRect(x: 0, y: 0, width: 20, height: 20))
        leftBtn.setImage(UIImage(named:"backIcon"), for: UIControlState.normal)
        //leftBtn.addTarget(self, action: #selector(doBackAction(btn:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //MARK: - Event Response
    func doBackAction(btn:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
