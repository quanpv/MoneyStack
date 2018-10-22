//
//  UserDefaultExtension.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

extension UserDefaults {
    
    static func saveCurrenThemeIndex(_ index: Int) {
        UserDefaults.standard.set(index, forKey: "CURRENT_THEME_INDEX")
    }
    
    static func getCurrenThemeIndex() -> Int {
        guard let index: Int = UserDefaults.standard.object(forKey: "CURRENT_THEME_INDEX") as? Int else {
            saveCurrenThemeIndex(0)
            return 0
        }
        return index
    }
    
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
