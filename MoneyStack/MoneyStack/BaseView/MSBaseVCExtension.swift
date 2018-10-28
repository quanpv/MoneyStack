//
//  MSBaseVCExtension.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

extension MSBaseVC {
    
    func adjustTopSpace() -> CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let topPadding = window?.safeAreaInsets.top
            return topPadding!
        } else {
            adjustableTopSpace?.constant = MSBaseVCConstant.HEIGHT_TOP_MENU_BAR + 20 // 20 for status bar
            return 20
        }
    }

    @objc func callOpenLeftMenu() {
        MSDelegate.openLeftMenu()
    }
    
    func makeTopBar() {
        if topBarType  == 0 { return }
        let additionHeight = adjustTopSpace()
        
        var point = CGPoint(x: 0, y: 0)
        var size = CGSize(width: UIScreenConstant.WIDTH, height: MSBaseVCConstant.HEIGHT_TOP_MENU_BAR + additionHeight)
        topBarContainer = UIView(frame: CGRect(origin: point, size: size))
        topBarContainer?.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        
        point.y = size.height - MSBaseVCConstant.HEIGHT_TOP_MENU_BAR
        size.height = MSBaseVCConstant.HEIGHT_TOP_MENU_BAR
        topBarView = MSTopBarView(frame: CGRect(origin: point, size: size), type: self.topBarType)
        topBarView?.delegate = self
        topBarContainer?.addSubview(topBarView!)
        view.addSubview(topBarContainer!)
    }
    
    func onViewDidLoad() {
        if !isStartedScreen {
            autoBackground()
        }
        setupViewHolder()
        makeTopBar()
    }
    
    private func autoBackground() {
        backGroundImage = UIImageView(frame: UIScreenConstant.BOUNDS)
        backGroundImage.image = UIImage(named: "Default_Background")
        backGroundImage.contentMode = .scaleAspectFill
        darkerView = UIView(frame: backGroundImage.frame)
        darkerView.backgroundColor = MSDelegate.config.mainColor
        darkerView.alpha = darkViewAlpha
        backGroundImage.addSubview(darkerView)
        view.insertSubview(backGroundImage, at: 0)
    }
    func updateBackGround(index: Int) {
        //MARK: - TODO: updateAutoBackGround
        if isStartedScreen {
            return
        }
    }
}

//MARK: - Use for holding VC instead of using UINavigationController
class MSStackOfView {
    private var rootView: UIViewController?
    var stackOfViews: [UIViewController] = []
    
    init(_ rootView: MSBaseVC) {
        self.rootView = rootView
    }
    
    func push(_ view: UIViewController) {
        stackOfViews.append(view)
    }
    
    func doPop() {
        if stackOfViews.count > 0 {
            let _ = stackOfViews.removeLast()
        }
    }
    
    func getPop() -> UIViewController{
        return stackOfViews.removeLast()
    }
    
    func getRoot() -> UIViewController {
        return rootView!
    }
    
    func getLast() -> UIViewController {
        if stackOfViews.count == 0 {
            return rootView!
        }
        return stackOfViews.last!
    }
}

