//
//  MainTabBarView.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 9/23/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class MainTabBarView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth / 3
        let defaultLabelHeight:CGFloat = 20
        let imgWidth: CGFloat = 45
        let imgTop :CGFloat = 3
        
        //1st tab
        let control1st = UIControl(frame: CGRect(x: 0, y: 0, width: itemWidth, height: frame.height))
        
        let image1stView = UIImageView(frame: CGRect(x: (control1st.frame.width - imgWidth)/2, y: imgTop, width: imgWidth , height: control1st.frame.height - defaultLabelHeight - imgTop))
        image1stView.image = UIImage(named: "locationnormalicon")
        image1stView.contentMode = UIViewContentMode.scaleAspectFit
        
        let title1stLabel = UILabel(frame: CGRect(x: 0, y: control1st.frame.height - defaultLabelHeight, width: control1st.frame.size.width, height: defaultLabelHeight))
        title1stLabel.text = "Location"
        title1stLabel.textAlignment = NSTextAlignment.center
        title1stLabel.font = UIFont.systemFont(ofSize: 11)
        title1stLabel.textColor = UIColor.lightGray
        
        control1st.addSubview(image1stView)
        control1st.addSubview(title1stLabel)
        
        //2nd tab
        let control2nd = UIControl(frame: CGRect(x: itemWidth, y: 0, width: itemWidth, height: frame.height))
        control2nd.backgroundColor = .red
        let image2ndView = UIImageView(frame: CGRect(x: 0, y: -20, width: itemWidth, height: frame.height - defaultLabelHeight + 20))
        image2ndView.image = UIImage(named: "homeicon")
        image2ndView.contentMode = UIViewContentMode.scaleAspectFit
        
        control2nd.addSubview(image2ndView)
        
        //3rd tab
        let control3rd = UIControl(frame : CGRect(x: itemWidth * 2 , y: 0, width: itemWidth , height: frame.size.height))
        let image3rdView = UIImageView(frame: CGRect(x: (control3rd.frame.width - imgWidth)/2, y: imgTop, width: imgWidth , height: control3rd.frame.height - defaultLabelHeight - imgTop))
        image3rdView.image = UIImage(named: "favournormalicon")
        image3rdView.contentMode = UIViewContentMode.scaleAspectFit
        
        let title3rdLabel = UILabel(frame: CGRect(x: 0, y: control3rd.frame.height - defaultLabelHeight, width: control3rd.frame.size.width, height: defaultLabelHeight))
        title3rdLabel.text = "Favour"
        title3rdLabel.textAlignment = NSTextAlignment.center
        title3rdLabel.font = UIFont.systemFont(ofSize: 11)
        title3rdLabel.textColor = UIColor.lightGray
        
        control3rd.addSubview(image3rdView)
        control3rd.addSubview(title3rdLabel)
        
        self.addSubview(control1st)
        self.addSubview(control2nd)
         self.addSubview(control3rd)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
