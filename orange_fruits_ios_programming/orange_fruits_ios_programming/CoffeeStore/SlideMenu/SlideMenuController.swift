//
//  SlideMenuController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 2/10/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

public struct SlideMenuOptions {
    public static var leftViewWidth: CGFloat = 270.0
    public static var leftBezelWidth: CGFloat? = 16.0
    public static var contentViewScale: CGFloat = 0.96
    public static var contentViewOpacity: CGFloat = 0.5
    public static var contentViewDrag: Bool = false
    public static var shadowOpacity: CGFloat = 0.0
    public static var shadowRadius: CGFloat = 0.0
    public static var shadowOffset: CGSize = CGSize(width: 0,height: 0)
    public static var panFromBezel: Bool = true
    public static var animationDuration: CGFloat = 0.4
    public static var animationOptions: UIViewAnimationOptions = []
    public static var rightViewWidth: CGFloat = 270.0
    public static var rightBezelWidth: CGFloat? = 16.0
    public static var rightPanFromBezel: Bool = true
    public static var hideStatusBar: Bool = false
    public static var pointOfNoReturnWidth: CGFloat = 44.0
    public static var simultaneousGestureRecognizers: Bool = true
    public static var opacityViewBackgroundColor: UIColor = UIColor.black
    public static var panGesturesEnabled: Bool = true
    public static var tapGesturesEnabled: Bool = true
}

class SlideMenuController: UIViewController {
    
    open var opacityView = UIView()
    open var mainContainerView = UIView()
    open var leftContainerView = UIView()
    open var rightContainerView = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public convenience init(mainViewController : UIViewController, leftMenuViewController : UIViewController){
        self.init()
        
        initView()
    }
    
    open func initView(){
        mainContainerView = UIView(frame: view.bounds)
        mainContainerView.backgroundColor = .clear
        mainContainerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.insertSubview(mainContainerView, at: 0)
        
        var opacityFrame = view.bounds
        var opacityOffset : CGFloat = 0
        opacityFrame.origin.y = opacityFrame.origin.y + opacityOffset
        opacityFrame.size.height = opacityFrame.size.height  - opacityOffset
        var opacityView = UIView(frame: opacityFrame)
        opacityView.backgroundColor = SlideMenuOptions.opacityViewBackgroundColor
        opacityView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        opacityView.layer.opacity = 0
        view.insertSubview(opacityView, at: 1)
        
        var leftFrame = view.bounds
        leftFrame.size.width = SlideMenuOptions.leftViewWidth
        leftFrame.origin.x = -SlideMenuOptions.leftViewWidth
        var leftOffset : CGFloat = 0
        leftFrame.origin.y = leftFrame.origin.y + leftOffset
        leftFrame.size.height = leftFrame.size.height - leftOffset
        leftContainerView = UIView(frame: leftFrame)
        leftContainerView.backgroundColor = .clear
        leftContainerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(leftContainerView, at: 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

extension UIViewController {
    
    public func addLeftBarButtonWithImage(_ buttonImage : UIImage){
        let button = UIButton(type: .custom)
        button.setImage(buttonImage, for: .normal)
        button.contentMode = .scaleToFill
        button.frame = CGRect(x: 0, y: 0, width: 1, height: 2)
        let leftButton = UIBarButtonItem(customView: button)
        
        navigationItem.leftBarButtonItem = leftButton
    }
}
