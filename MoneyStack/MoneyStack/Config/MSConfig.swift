//
//  MSConfig.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/9/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

let MSDelegate = UIApplication.shared.delegate as! AppDelegate

let NotificationChangeTheme: Notification.Name = Notification.Name("NotificationChangeTheme")

enum ThemeCode {
    case Green,
    Red, Blue, Yellow
}

struct ThemeColor {
    var mainColor: UIColor = UIColor()
    var subColor: UIColor = UIColor()
}

class MSConfig {
    var themeList = [
        (MSColorList.GREEN_EMERALD,MSColorList.RED_RUBY),
        (MSColorList.RED_RUBY,MSColorList.GREEN_EMERALD),
        (MSColorList.BLUE_SAPPHIRE,MSColorList.YELLOW_GOLD),
        (MSColorList.YELLOW_GOLD,MSColorList.BLUE_SAPPHIRE),
        ]
    var userThemeList: [(UIColor,UIColor)] = []
    
    var currentThemeIndex: Int = 0
    var mainColor: UIColor = UIColor()
    var subColor: UIColor = UIColor()
    
    init() {
        currentThemeIndex = UserDefaults.getCurrenThemeIndex()
        mainColor = themeList[currentThemeIndex].0
        subColor = themeList[currentThemeIndex].1
    }
    
    func updateCurrentThemeIndex(_ index: Int) {
        currentThemeIndex = index
        mainColor = themeList[currentThemeIndex].0
        subColor = themeList[currentThemeIndex].1
        UserDefaults.saveCurrenThemeIndex(index)
        NotificationCenter.default.post(Notification(name: NotificationChangeTheme, object: themeList[index], userInfo: nil))
    }
}

