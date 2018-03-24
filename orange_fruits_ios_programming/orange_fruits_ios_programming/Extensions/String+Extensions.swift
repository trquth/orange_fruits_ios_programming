//
//  String+Extensions.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/19/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation

extension String {
    
    var titleize: String {
        var words = self.lowercased().characters.split { $0 == " " }.map { String($0) }
        words[0] = words[0].capitalized
        
        return words.joined(separator: " ")
    }
    
}
