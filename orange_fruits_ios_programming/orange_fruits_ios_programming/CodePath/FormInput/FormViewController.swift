//
//  FormViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 6/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    var preferences : Preferences?{
        didSet{
            updateLabels()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        updateLabels()
        setupViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let headerLbl : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current Preferences"
        
        return label
    }()
    
    let autoRefreshLbl : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Auto Refresh :"
        
        return label
    }()
    
    let playSoundsLbl : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Play Sounds :"
        label.textColor = UIColor.black
        
        return label
    }()
    
    let showPhotosLbl : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Show Photos :"
        
        return label
    }()
    
    let editPreferenceBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit Preferences", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(gotoPreferences), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func gotoPreferences() {
        let  preferencesTableVC = PreferencesViewController()
        self.navigationController?.pushViewController(preferencesTableVC, animated: true)
//        present(preferencesTableVC, animated: true, completion: nil)
    }
    
    private func updateLabels(){
        guard let preferencesValue = preferences else {
            return
        }
        
        autoRefreshLbl.text = "Auto Refresh : \(preferencesValue.autoRefresh ? "Yes" : "No")"
        playSoundsLbl.text = "Play Sounds : \(preferencesValue.playSounds ? "Yes" : "No")"
        showPhotosLbl.text = "Show Photos : : \(preferencesValue.showPhotos ? "Yes" : "No")"
        
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(headerLbl)
        view.addSubview(autoRefreshLbl)
        view.addSubview(playSoundsLbl)
        view.addSubview(showPhotosLbl)
        view.addSubview(editPreferenceBtn)
        
        let views = ["v1": headerLbl,
                     "v2":autoRefreshLbl,
                     "v3":playSoundsLbl,
                     "v4":showPhotosLbl,
                     "v5":editPreferenceBtn]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v1]", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v2]", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v3]", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v4]", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v5]", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[v1(50)][v2(==v1)][v3(==v1)][v4(==v1)][v5(==v1)]", options: [], metrics: nil, views: views))
        
        headerLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         autoRefreshLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         playSoundsLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         showPhotosLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         editPreferenceBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}
