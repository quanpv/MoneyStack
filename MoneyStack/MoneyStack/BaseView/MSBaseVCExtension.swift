//
//  MSBaseVCExtension.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

extension MSBaseVC {

    @objc func callOpenLeftMenu() {
        MSDelegate.openLeftMenu()
    }
    
    func onViewDidLoad() {
        if !isStartedScreen {
            autoBackground()
        }
        setupViewHolder()
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

