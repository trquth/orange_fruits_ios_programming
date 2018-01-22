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
        }
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}
