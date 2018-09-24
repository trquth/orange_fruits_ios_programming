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
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth / 5
        let defaultLabelHeight:CGFloat = 20
        let imgWidth: CGFloat = 25
        let imgTop :CGFloat = 3
        
        //1st tab
        let frame1st = CGRect(x: 0, y: 0, width: screenWidth , height: frame.size.height)
        let image1stView = UIImageView(frame: CGRect(x: (frame1st.size.width - imgWidth)/2, y: imgTop, width: imgWidth , height: frame1st.size.height - defaultLabelHeight - imgTop))
        image1stView.image = UIImage(named: "locationnormalicon")
        image1stView.contentMode = UIViewContentMode.scaleAspectFit
        
        let title1stLabel = UILabel(frame: CGRect(x: itemWidth * 0, y: 0, width: itemWidth, height: frame1st.size.height))
        title1stLabel.text = "Location"
        title1stLabel.textAlignment = NSTextAlignment.center
        title1stLabel.font = UIFont.systemFont(ofSize: 11)
        title1stLabel.textColor = UIColor.lightGray
        
        self.addSubview(image1stView)
        self.addSubview(title1stLabel)
        
        //2nd tab
        let frame2nd = CGRect(x: imgWidth , y: 0, width: screenWidth , height: frame.size.height)
        let image2ndView = UIImageView(frame: CGRect(x: 0, y: 0, width: itemWidth, height: frame2nd.size.height))
        image2ndView.image = UIImage(named: "locationnormalicon")
        image2ndView.contentMode = UIViewContentMode.scaleAspectFit
        
        let title2ndLabel = UILabel(frame: CGRect(x: itemWidth * 1, y: 0, width: itemWidth, height: frame2nd.size.height))
        title2ndLabel.text = "Location"
        title2ndLabel.textAlignment = NSTextAlignment.center
        title2ndLabel.font = UIFont.systemFont(ofSize: 11)
        title2ndLabel.textColor = UIColor.lightGray
        
        self.addSubview(image2ndView)
        self.addSubview(title2ndLabel)
        
        //3rd tab
        let frame3rd = CGRect(x: imgWidth * 2 , y: 0, width: screenWidth , height: frame.size.height)
        let image3rdView = UIImageView(frame: CGRect(x: 0, y: 0, width: itemWidth, height: frame3rd.size.height))
        image3rdView.image = UIImage(named: "locationnormalicon")
        image3rdView.contentMode = UIViewContentMode.scaleAspectFit
        
        let title3rdLabel = UILabel(frame: CGRect(x: itemWidth * 1, y: 0, width: itemWidth, height: frame3rd.size.height))
        title3rdLabel.text = "Location"
        title3rdLabel.textAlignment = NSTextAlignment.center
        title3rdLabel.font = UIFont.systemFont(ofSize: 11)
        title3rdLabel.textColor = UIColor.lightGray
        
        self.addSubview(image3rdView)
        self.addSubview(title3rdLabel)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
