//
//  MSFirstBalanceInfoVM.swift
//  MoneyStack
//
//  Created by Pham Van Quan on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import Foundation

typealias SaveBalanceInfoClosure = () -> Void

class MSFirstBalanceInfoVM: MSNavigationVM {
    var onSaveBalanceInfo:SaveBalanceInfoClosure?
    
}
