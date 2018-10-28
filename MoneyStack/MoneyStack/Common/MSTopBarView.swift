//
//  MSTopBarView.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

protocol MSTopBarViewDelegate {
    func clickTopBar(position: TopBarPosition)
}

enum TopBarType: Int {
    case None,
    Menu,
    Menu_Filter,
    Back,
    Back_Plus
}

class MSTopBarView: UIView {
    
    var type: Int = 0 //None - Refer to TopBarType
    var topBarType: TopBarType {
        guard let a = TopBarType(rawValue: self.type) else { return TopBarType.None }
        return a
    }
    
    var leftButton: MSButtonView?
    var middleButton: UIButton?
    var rightButton: MSButtonView?
    
    convenience init(frame: CGRect, type: Int) {
        self.init(frame: frame)
        self.type = type
        backgroundColor = UIColor.clear
        createButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoresizesSubviews = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        autoresizesSubviews = false
    }
    
    let buttonSize: CGSize = CGSize(width: MSBaseVCConstant.HEIGHT_TOP_MENU_BAR, height: MSBaseVCConstant.HEIGHT_TOP_MENU_BAR)
    let middleIconSize: CGSize = CGSize(width: 34, height: 34)
    let buttonIconSize: CGSize = CGSize(width: 30, height: 30)

    var delegate: MSTopBarViewDelegate?
    
    @objc func clickLeft() {
        delegate?.clickTopBar(position: .Left)
    }
    
    @objc func clickMiddle() {
        delegate?.clickTopBar(position: .Middle)
    }
    
    @objc func clickRight() {
        delegate?.clickTopBar(position: .Right)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = MSDelegate.config.subColor
        createButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let _ = leftButton {
            adjustButtonPosition(leftButton!, position: .Left)
        }
        if let _ = rightButton {
            adjustButtonPosition(rightButton!, position: .Right)
        }
    }
    
    func createButton() {
        guard let correctType: TopBarType = TopBarType(rawValue: type) else {
            return
        }
        createMiddleIcon()
        switch correctType {
        case .Back:
            createBackButton(.Left)
        case .Back_Plus:
            createBackButton(.Left)
            createPlusButton(.Right)
        case .None:
            break
        case .Menu:
            createMenuButton(.Left)
        case .Menu_Filter:
            createMenuButton(.Left)
            createFilterButton(.Right)
            break
        }
    }
    
    func updateColor() {
        backgroundColor = MSDelegate.config.subColor
        leftButton?.backgroundColor = MSDelegate.config.mainColor
        rightButton?.backgroundColor = MSDelegate.config.mainColor
    }
    
    func createBackButton(_ position: TopBarPosition) {
        leftButton = MSButtonView.init(buttonSize, iconSize: buttonIconSize, iconName: "ic_back_42", target: self, action: #selector(clickLeft), isMain: true, hasCorner: false, hasBorder: false)
        addSubview(leftButton!)
    }
    
    func createPlusButton(_ position: TopBarPosition) {
        rightButton = MSButtonView.init(buttonSize, iconSize: buttonIconSize, iconName: "ic_plus_42", target: self, action: #selector(clickRight), isMain: true, hasCorner: false, hasBorder: false)
        addSubview(rightButton!)
    }
    
    func createMenuButton(_ position: TopBarPosition) {
        leftButton = MSButtonView.init(buttonSize, iconSize: buttonIconSize , iconName: "ic_menu_96", target: self, action: #selector(clickLeft), isMain: true, hasCorner: false, hasBorder: false)
        addSubview(leftButton!)
    }
    
    func createFilterButton(_ position: TopBarPosition) {
        rightButton = MSButtonView.init(buttonSize, iconSize: buttonIconSize, iconName: "ic_filter_42", target: self, action: #selector(clickRight), isMain: true, hasCorner: false, hasBorder: false)
        addSubview(rightButton!)
    }
    
    func createMiddleIcon() {
        middleButton = UIButton(frame: CGRect(x: (UIScreenConstant.WIDTH - buttonSize.width)/2, y: 0, width: buttonSize.width, height: buttonSize.height))
        middleButton!.backgroundColor = UIColor.clear
        let imageView = UIImageView(frame: CGRect(x: (UIScreenConstant.WIDTH - middleIconSize.width)/2, y: (MSBaseVCConstant.HEIGHT_TOP_MENU_BAR - middleIconSize.height)/2, width: middleIconSize.width, height: middleIconSize.height))
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "logo_button")
        imageView.layer.cornerRadius = 4.5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        
        middleButton!.addTarget(self, action: #selector(clickMiddle), for: .touchUpInside)
        addSubview(imageView)
        addSubview(middleButton!)
    }
    
    func adjustButtonPosition(_ button: UIView, position: TopBarPosition) {
        switch position {
        case .Left:
            button.frame = CGRect(origin: CGPoint.zero, size: button.frame.size)
        case .Middle:
            button.center = CGPoint(x: self.width / 2, y: self.height / 2)
        case .Right:
            let topSpace = (self.height - button.height) / 2
            let newPoint = CGPoint(x: self.width - button.width - topSpace, y: topSpace)
            button.frame = CGRect(origin: newPoint, size: button.frame.size)
        }
    }
}
