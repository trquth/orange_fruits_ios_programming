//
//  ViewController+Extension.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 1/20/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

extension ListTodosController: UIScrollViewDelegate {
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
//            view.removeConstraint(NSLayoutConstraint(item: customHeaderView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 90))
//            view.addConstraint(NSLayoutConstraint(item: customHeaderView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 180))
//            customHeaderView.layoutIfNeeded()
        }
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if headerHeightConstraint.constant > 150 {
            animatedHeader()
        }
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if headerHeightConstraint.constant > 150 {
            animatedHeader()
        }
    }
    
    func animatedHeader() {
        self.headerHeightConstraint.constant = 90
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {self.view.layoutIfNeeded()}, completion: nil)
    }
}
