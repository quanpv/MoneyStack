//
//  MSDesignableThemeButton.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/21/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

@IBDesignable
class MSDesignableThemeButton: UIButton {
    
    @IBInspectable var isMain: Bool = true
    var iconHeightRatio: CGFloat = 0.7
    
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//        }
//    }
//    @IBInspectable var borderWidth: CGFloat = 0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//    @IBInspectable var borderColor: UIColor = UIColor.black {
//        didSet {
//            layer.borderColor = borderColor.cgColor
//        }
//    }
    
    func updateGUI() {
        if self.isMain {
            layer.borderWidth = 0
        } else {
            layer.borderWidth = 1.0
            layer.borderColor = UIColor.white.cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustIconPosition()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageEdgeInsets = .zero
        backgroundColor = isMain ? MSDelegate.config.mainColor : MSDelegate.config.subColor
        adjustIconPosition()
        updateGUI()
    }
    
    func adjustIconPosition() {
        self.imageView?.frame = CGRect(x: 0, y: 0, width: self.height * iconHeightRatio, height: self.height * iconHeightRatio)
        self.imageView?.center = CGPoint(x: self.width / 2, y: self.height / 2)
        layer.cornerRadius = self.height / 10
    }
}
