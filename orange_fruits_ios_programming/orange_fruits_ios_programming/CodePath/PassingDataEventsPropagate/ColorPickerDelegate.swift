//
//  ColorPickerDelegate.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 6/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import Foundation
import UIKit

protocol ColorPickerDelegate : class {
    func colorPicker(picker : ColorPickerViewController, didPickColor color : UIColor?)
}
