//
//  MSThemeIV.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/20/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSThemeIV: UIImageView {
    
    @IBInspectable var imageName: String = "ic_question_45"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentMode = .scaleAspectFill
        setImageFollowTheme()
        NotificationCenter.default.addObserver(self, selector: #selector(handleChangeTheme(notification:)), name: NotificationChangeTheme, object: nil)
    }
    
    @objc func handleChangeTheme(notification: Notification) {
        setImageFollowTheme()
    }
    
    func setImageFollowTheme() {
        let index = MSDelegate.config.currentThemeIndex
        switch index {
        case 0:
            image = UIImage(named: imageName + "_red")
        case 1:
            image = UIImage(named: imageName + "_green")
        case 2:
            image = UIImage(named: imageName + "_yellow")
        case 3:
            image = UIImage(named: imageName + "_blue")
        default:
            break
        }
    }
}
