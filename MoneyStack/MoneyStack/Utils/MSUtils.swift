//
//  MSUtils.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import Foundation
import UIKit
class MSUtils:NSObject{
    class func objectCorner(_ obj:UIView ,_ radius:CGFloat){
        obj.layer.cornerRadius = radius
        obj.clipsToBounds = true
    }
    
    class func makeViewBorder(_ obj:UIView ,_ width:Int, _ color:CGColor){
        obj.layer.borderWidth = 1
        obj.layer.borderColor = color
    }
}


