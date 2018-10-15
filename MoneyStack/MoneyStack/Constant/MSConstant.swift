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
