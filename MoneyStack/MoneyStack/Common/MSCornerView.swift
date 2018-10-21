//
//  MSCornerView.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/21/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSCornerView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.height / 10
        clipsToBounds = true
    }
}

class MSCornerButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.height / 10
        clipsToBounds = true
    }
}

class MSCornerLabel: UILabel  {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.height / 10
        clipsToBounds = true
    }
}
