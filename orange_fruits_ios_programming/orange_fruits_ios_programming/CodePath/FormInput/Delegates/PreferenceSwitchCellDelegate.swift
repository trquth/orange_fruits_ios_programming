//
//  PreferenceSwitchCellDelegate.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 6/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation

protocol PreferenceSwitchCellDelegate : class {
    func preferenceSwitchCellDidToggle(cell : PreferenceTableCell, newValue : Bool)
}
