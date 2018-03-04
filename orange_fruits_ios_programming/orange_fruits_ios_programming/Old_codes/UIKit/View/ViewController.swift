//
//  ViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 12/14/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "View - UIKit - Swift"
        
        view.backgroundColor = .white
        
        setupView()
    }
    
    let viewContainer : UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 100, width: 200, height: 200))
        view.backgroundColor = UIColor(red: 98/255, green: 97/255, blue: 104/255, alpha: 1)
        
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.masksToBounds = true
        
        view.alpha = 0.2
        return view
    }()
    
    let firstView : UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 100, width: 50, height: 50))
        view.backgroundColor = UIColor(red: 75/255, green: 57/255, blue: 155/255, alpha: 1)
        
        return view
    }()
    
    let secondView : UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 200, width: 60, height: 60))
        view.backgroundColor = UIColor(red: 216/255, green: 39/255, blue: 65/255, alpha: 1)
        
        return view
    }()
    
    let thirdView : UIView = {
        let view = UIView(frame: CGRect(x: 30, y: 300, width: 70, height: 70))
        view.backgroundColor = UIColor(red: 216/255, green: 39/255, blue: 213/255, alpha: 1)
        
        return view
    }()
    
    let fourthView : UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 300, width: 70, height: 70))
        view.backgroundColor = UIColor(red: 50/255, green: 216/255, blue: 39/255, alpha: 1)
        
        return view
    }()
    
    
    func setupView()  {
        view.addSubview(viewContainer)
        view.bringSubview(toFront: firstView)
        view.sendSubview(toBack: secondView)
        view.insertSubview(thirdView, aboveSubview: secondView)
        view.addSubview(fourthView)
        view.exchangeSubview(at: 2, withSubviewAt:3)
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .white
        if self.responds(to: #selector(getter: UIViewController.edgesForExtendedLayout))
        {
            self.edgesForExtendedLayout = UIRectEdge.all
        }
    }
}
