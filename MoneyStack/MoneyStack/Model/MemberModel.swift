//
//  MemberModel.swift
//  MoneyStack
//
//  Created by Pham Van Quan on 10/26/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import Foundation

class MemberModel {
    
    var name: String?
    var birthDay: String?
    var gender: String?
    init() {
        
    }
    init(_ name: String?,_ birthDay: String?,_ gender: String?) {
        self.name = name
        self.birthDay = birthDay
        self.gender = gender
    }
}
