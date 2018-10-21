//
//  MSFullSizeIconButton.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/21/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

@IBDesignable
class MSFullSizeIconButton: UIButton {
    
    @IBInspectable var iconHeightRatio: CGFloat = 1.0
    @IBInspectable var iconHeight: CGFloat = 0
    @IBInspectable var corner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = corner
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageEdgeInsets = UIEdgeInsets.zero
        adjustIconPosition()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustIconPosition()
    }
    
    func adjustIconPosition() {
        self.imageView?.frame = CGRect(x: 0, y: 0,
                                       width: iconHeight > 0 ? iconHeight : self.height * iconHeightRatio,
                                       height: iconHeight > 0 ? iconHeight : self.height * iconHeightRatio)
        self.imageView?.center = CGPoint(x: self.width / 2, y: self.height / 2)
    }
}
