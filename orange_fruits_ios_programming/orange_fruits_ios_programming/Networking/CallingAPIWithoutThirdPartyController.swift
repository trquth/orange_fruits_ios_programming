//
//  CallingAPIWithoutThirdPartyController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/24/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class CallingAPIWithoutThirdPartyController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Without third party"
        
        setupView()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        self.edgesForExtendedLayout = []
    }
    
    func createButtonWithTitle(title: String ) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(red: 2/255, green: 106/255, blue: 252/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.isEnabled = true
        
        return button
    }
    
    func setupView() {
        let getAllPostsBtn = createButtonWithTitle(title: "Get all posts")
        getAllPostsBtn.frame = CGRect(x: 10, y: 10, width: UIScreen.main.bounds.width - 10 * 2, height: 40)
        getAllPostsBtn.addTarget(self, action:#selector(getAllPosts(_:)) , for: .touchUpInside)
        view.addSubview(getAllPostsBtn)
        
        let getATodoByIDBtn = createButtonWithTitle(title: "Get a todo by id")
        getATodoByIDBtn.frame = CGRect(x: 10, y: 55, width: UIScreen.main.bounds.width - 10 * 2, height: 40)
        getATodoByIDBtn.addTarget(self, action:#selector(getATodoByID(_:)) , for: .touchUpInside)
        view.addSubview(getATodoByIDBtn)
        
        let getAnUserByIDBtn = createButtonWithTitle(title: "Get an user by id")
        getAnUserByIDBtn.frame = CGRect(x: 10, y: 100, width: UIScreen.main.bounds.width - 10 * 2, height: 40)
        getAnUserByIDBtn.addTarget(self, action:#selector(getAnUserByID(_:)) , for: .touchUpInside)
        view.addSubview(getAnUserByIDBtn)
    }
    
    @objc func getAllPosts(_ sender: UIButton)  {
        CallingAPIWithoutThirdPartyHelper.getListPosts()
    }
    
    @objc func getATodoByID(_ sender: UIButton){
        Todo.todoByID(1, completionHandler: {
            (todo, error) in
            if let error = error {
                //got an error in getting the data, need to handle it
                print(error)
                return
            }
            guard let todo = todo else {
                print("error getting first todo: result is nil")
                return
            }
            print(todo)
        })
    }
    
    @objc func getAnUserByID(_ sender: UIButton){
        User.getUser(1)
    }
}
