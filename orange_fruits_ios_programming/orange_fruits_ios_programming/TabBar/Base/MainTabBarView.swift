//
//  MainTabBarView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 9/23/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

protocol MainTabBarDelegate {
    func didChooseItem(itemIndex : Int)
}

class MainTabBarView : UIView {
    
    var delegate: MainTabBarDelegate?
    
    var control1st : UIControl!
    var image1stView : UIImageView!
    var title1stLabel : UILabel!
    var control2nd : UIControl!
    var image2ndView : UIImageView!
    var control3rd : UIControl!
    var image3rdView : UIImageView!
    var title3rdLabel : UILabel!
    
    
    override init(frame: CGRect) {
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth / 3
        let defaultLabelHeight:CGFloat = 20
        let imgWidth: CGFloat = 45
        let imgTop :CGFloat = 3
        
        //1st tab
         control1st = UIControl(frame: CGRect(x: 0, y: 0, width: itemWidth, height: frame.height))
        
        image1stView = UIImageView(frame: CGRect(x: (control1st.frame.width - imgWidth)/2, y: imgTop, width: imgWidth , height: control1st.frame.height - defaultLabelHeight - imgTop))
        image1stView.image = UIImage(named: "locationnormalicon")
        image1stView.contentMode = UIViewContentMode.scaleAspectFit
        
        title1stLabel = UILabel(frame: CGRect(x: 0, y: control1st.frame.height - defaultLabelHeight, width: control1st.frame.size.width, height: defaultLabelHeight))
        title1stLabel.text = "Location"
        title1stLabel.textAlignment = NSTextAlignment.center
        title1stLabel.font = UIFont.systemFont(ofSize: 11)
        title1stLabel.textColor = UIColor.lightGray
        
        control1st.tag = 0
        
        control1st.addSubview(image1stView)
        control1st.addSubview(title1stLabel)
        
        //2nd tab
        control2nd = UIControl(frame: CGRect(x: itemWidth, y: 0, width: itemWidth, height: frame.height))
        let image2ndView = UIImageView(frame: CGRect(x: 0, y: -20, width: itemWidth, height: frame.height - defaultLabelHeight + 20))
        image2ndView.image = UIImage(named: "homeicon")
        image2ndView.contentMode = UIViewContentMode.scaleAspectFit
        
        control2nd.tag = 1
       
        control2nd.addSubview(image2ndView)
        
        //3rd tab
        let control3rd = UIControl(frame : CGRect(x: itemWidth * 2 , y: 0, width: itemWidth , height: frame.size.height))
        image3rdView = UIImageView(frame: CGRect(x: (control3rd.frame.width - imgWidth)/2, y: imgTop, width: imgWidth , height: control3rd.frame.height - defaultLabelHeight - imgTop))
        image3rdView.image = UIImage(named: "favournormalicon")
        image3rdView.contentMode = UIViewContentMode.scaleAspectFit
        
        title3rdLabel = UILabel(frame: CGRect(x: 0, y: control3rd.frame.height - defaultLabelHeight, width: control3rd.frame.size.width, height: defaultLabelHeight))
        title3rdLabel.text = "Favour"
        title3rdLabel.textAlignment = NSTextAlignment.center
        title3rdLabel.font = UIFont.systemFont(ofSize: 11)
        title3rdLabel.textColor = UIColor.lightGray
        
        control3rd.tag = 2
        
        control3rd.addSubview(image3rdView)
        control3rd.addSubview(title3rdLabel)
        
       
        
        super.init(frame: frame)
        self.backgroundColor = .white
        
        control1st.addTarget(self, action: #selector(self.didItemClick(_:)), for: .touchUpInside)
        control2nd.addTarget(self, action: #selector(self.didItemClick(_:)), for: .touchUpInside)
        control3rd.addTarget(self, action: #selector(self.didItemClick(_:)), for: .touchUpInside)
        
        self.addSubview(control1st)
        self.addSubview(control2nd)
        self.addSubview(control3rd)
    }
    
    @objc  private func didItemClick(_ sender: UIControl){
         image1stView.image = UIImage(named: "locationnormalicon")
        title1stLabel.textColor = UIColor.lightGray
         image3rdView.image = UIImage(named: "favournormalicon")
        title3rdLabel.textColor = UIColor.lightGray
        
        switch sender.tag {
        case 0:
            image1stView.image =  UIImage(named: "locationhighlighticon")
            title1stLabel.textColor = .blue
            break
        case 2:
            image3rdView.image =  UIImage(named: "favourhighlighticon")
            title3rdLabel.textColor = .blue
            break
        default:
            break
        }
        
        delegate?.didChooseItem(itemIndex: sender.tag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
