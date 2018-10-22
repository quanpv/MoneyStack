//
//  MSConstant.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/15/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

struct UIScreenConstant {
    static let WIDTH: CGFloat = UIScreen.main.bounds.size.width
    static let HEIGHT: CGFloat = UIScreen.main.bounds.size.height
    static let BOUNDS: CGRect = UIScreen.main.bounds
    static let HALF_BOUNDS_VERTICAL: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width / 2, height: UIScreen.main.bounds.size.height)
}

struct MSBaseVCConstant {
    static let HEIGHT_TOP_MENU_BAR: CGFloat = 50
}

struct MSLeftMenuVCConstant {
    static let SHOWING_WIDTH_RATIO: CGFloat = 0.5 // 50% of Screen width
}

struct MSColorList {
    /**
     Green - Emerald: #50C878
     Red - Ruby: #9B111E
     Blue - Sapphire: #0F52BA
     Yellow - Gold: #D6B400
     */
    static let GREEN_EMERALD: UIColor = UIColor(hex: "50C878")
    static let RED_RUBY: UIColor = UIColor(hex: "9B111E")
    static let BLUE_SAPPHIRE: UIColor = UIColor(hex: "0F52BA")
    static let YELLOW_GOLD: UIColor = UIColor(hex: "D6B400")
}

struct MSCollectionViewConst {
    static let interSpace: CGFloat = 10
    static let lineSpace: CGFloat = 10
}
