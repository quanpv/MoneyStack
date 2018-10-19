//
//  MSBaseVCExtension.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

extension MSBaseVC {
    
    var backGroundImage: UIImageView {
        let imageView = UIImageView(frame: UIScreenConstant.BOUNDS)
        imageView.image = UIImage(named: "Default_Background")
        imageView.contentMode = .scaleAspectFill
        let darkerView = UIView(frame: imageView.frame)
        darkerView.backgroundColor = isStartedScreen ? UIColor(hex: "#004445") : UIColor.black
        darkerView.alpha = isStartedScreen ? 0.7 : 0.4
        imageView.addSubview(darkerView)
        return imageView
    }
    
    func makeTopMenuBar() {
        menuBarContainer = UIView(frame: CGRect(x: 0, y: 20, width: UIScreenConstant.WIDTH , height: MSBaseVCConstant.HEIGHT_TOP_MENU_BAR))
        menuBarContainer?.backgroundColor = UIColor(hex: "2E6B29", alpha: 0.8)
        let menuButton: UIButton = UIButton(frame: CGRect(x: 8, y: 8, width: 34, height: 34))
        menuButton.setImage(UIImage(named: "ic_menu_64"), for: .normal)
        menuButton.addTarget(self, action: #selector(callOpenLeftMenu), for: .touchUpInside)
        menuBarContainer?.addSubview(menuButton)
        view.addSubview(menuBarContainer!)
    }
    
    @objc func callOpenLeftMenu() {
        MSDelegate.openLeftMenu()
    }
    
    func onViewDidLoad() {
        if !isStartedScreen {
            view.insertSubview(backGroundImage, at: 0)
        }
        setupViewHolder()
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

