//
//  MSButtonView.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSButtonView: UIView {

    var isMain: Bool = false
    var hasCorner: Bool = false
    var hasBorder: Bool = false

    init(_ size: CGSize, iconSize: CGSize, iconName: String, target: Any, action: Selector, isMain: Bool, hasCorner: Bool, hasBorder: Bool ) {
        super.init(frame: CGRect(origin: CGPoint.zero, size: size))
        self.isMain = isMain
        self.hasCorner = hasCorner
        self.hasBorder = hasBorder
        updateButton(size, iconSize: iconSize, iconName: iconName, target: target, action: action)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateButton(_ size: CGSize, iconSize: CGSize, iconName: String, target: Any, action: Selector ) {
        let button = UIButton(frame: self.frame)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let imageView = UIImageView(frame: CGRect(x: (self.frame.width - iconSize.width)/2, y: (self.frame.width - iconSize.width)/2, width: iconSize.width, height: iconSize.height))
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: iconName)
        
        addSubview(imageView)
        addSubview(button)
        
        backgroundColor = UIColor.clear // isMain ? MSDelegate.config.mainColor : MSDelegate.config.subColor
        layer.cornerRadius = hasCorner ? frame.height / 10 : 0
        clipsToBounds = hasCorner
        if hasBorder {
            layer.borderWidth = 1
            layer.borderColor = UIColor.white.cgColor
        }
    }
}
