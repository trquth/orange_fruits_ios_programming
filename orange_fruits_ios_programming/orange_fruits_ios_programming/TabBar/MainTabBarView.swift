//
//  MainTabbarView.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 7/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class MainTabBarView: UIView {
    var itemArray : [MainTabbarItem] = []
    
    init(frame: CGRect, tabbarConfigArr: [Dictionary<String, String>]) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        let screenW = UIScreen.main.bounds.width
        let itemWidth = screenW / CGFloat(tabbarConfigArr.count)
        for i in 0..<tabbarConfigArr.count{
            let itemDict = tabbarConfigArr[i]
            let itemFrame = CGRect(x: itemWidth * CGFloat(i), y: 0, width: itemWidth, height: frame.size.height)
            let itemView = MainTabbarItem(frame: itemFrame, itemDict: itemDict, itemIndex: i)
            self.addSubview(itemView)
         }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

class MainTabbarItem : UIControl {
    
    var itemDict : Dictionary<String, String>
    let imgView : UIImageView
    let titleLabel : UILabel
    
    var currentSelectState  = false {
        didSet {
            if currentSelectState {
                imgView.image = UIImage(named:itemDict["SelectedImg"]!)
                titleLabel.textColor = UIColor.red
            }else{
                imgView.image = UIImage(named: itemDict["NormalImg"]!)
                titleLabel.textColor = UIColor.lightGray
            }
        }
    }
    
    init(frame: CGRect, itemDict : Dictionary<String , String>, itemIndex : Int) {
        self.itemDict = itemDict
        
        let defaultLabelH : CGFloat = 20.0
        var imgTop :CGFloat = 3.0
        var imgWidth :CGFloat = 25.0
        if itemIndex == 2 {
            imgTop  = -20.0
            imgWidth = 50.0
        }
        
        let imgLeft = (frame.size.width - imgWidth)/2
        let imgHeight = frame.size.height - defaultLabelH - imgTop
        
        imgView = UIImageView(frame: CGRect(x: imgLeft, y: imgTop, width: imgWidth, height: imgHeight))
        imgView.image = UIImage(named : itemDict["NormalImg"]!)
        imgView.contentMode  = UIViewContentMode.scaleAspectFill
        
        titleLabel = UILabel(frame: CGRect(x: 0,
                                           y: frame.height - defaultLabelH,
                                           width: frame.size.width , height: defaultLabelH))
        titleLabel.text = itemDict["Title"]!
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 11)
        titleLabel.textColor = UIColor.lightGray
        
        super.init(frame: frame)
        self.addSubview(imgView)
        self.addSubview(titleLabel)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
