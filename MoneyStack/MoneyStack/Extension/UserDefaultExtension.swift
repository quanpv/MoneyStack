//
//  UserDefaultExtension.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

extension UserDefaults {
    
    static func saveMainColor(_ colorHex: String) {
        UserDefaults.standard.set(colorHex, forKey: "MAIN_COLOR")
    }
    
    static func saveSubColor(_ colorHex: String) {
        UserDefaults.standard.set(colorHex, forKey: "SUB_COLOR")
    }
    
    static func getMainColor() -> UIColor {
        guard let color: String = UserDefaults.standard.object(forKey: "MAIN_COLOR") as? String else {
            saveMainColor("50C878")
            return UIColor(hex: "50C878")
        }
        return UIColor(hex: color)
    }
    
    static func getSubColor() -> UIColor{
        guard let color: String = UserDefaults.standard.object(forKey: "SUB_COLOR") as? String else {
            saveSubColor("9B111E")
            return UIColor(hex: "9B111E")
        }
        return UIColor(hex: color)
    }
}
