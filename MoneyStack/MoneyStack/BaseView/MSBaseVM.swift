	//
//  MSBaseVM.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/9/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSBaseVM: NSObject {
    
    var ownerView: MSBaseVC?
    
    init(_ ownerView: MSBaseVC) {
        self.ownerView = ownerView
    }
}
