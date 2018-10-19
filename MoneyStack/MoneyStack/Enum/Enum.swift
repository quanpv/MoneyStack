//
//  Enum.swift
//  MoneyStack
//
//  Created by Squall on 10/18/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import Foundation

class Enum: NSObject{
    
}

enum KindOfPicker: Int {
    case None = 1,
    Gender,
    KindOfUser
}

enum TopBarPosition: Int {
    case Left,
    Middle, Right
}

enum LeftMenuItem: Int {
    case Dashboard,
    News,
    Expense,
    BalanceInfo,
    Saving,
    Plan,
    Member,
    Personalize,
    Password,
    Logout
}
