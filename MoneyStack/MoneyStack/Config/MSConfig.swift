//
//  MSConfig.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/9/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

let MSDelegate = UIApplication.shared.delegate as! AppDelegate

class MSConfig {
    var mainColor: UIColor = UIColor()
    var subColor: UIColor = UIColor()
    
    init() {
        mainColor = UserDefaults.getMainColor()
        subColor = UserDefaults.getSubColor()
    }
    
}

