//
//  MSBaseVCExtension.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

//MARK: - Make and handle leftMenu
extension MSBaseVC {
    
    func makeLeftMenuBar() {
        menuBarContainer = UIView(frame: CGRect(x: 0, y: 20, width: UIScreenConstant.WIDTH , height: MSBaseVCConstant.HEIGHT_TOP_MENU_BAR))
        menuBarContainer?.backgroundColor = UIColor.lightGray
        let menuButton: UIButton = UIButton(frame: CGRect(x: 8, y: 8, width: 34, height: 34))
        menuButton.setImage(UIImage(named: "ic_menu_64"), for: .normal)
        menuButton.addTarget(self, action: #selector(openLeftMenu), for: .touchUpInside)
        menuBarContainer?.addSubview(menuButton)
        view.addSubview(menuBarContainer!)
    }
    
    func closeLeftMenu() {
        let window2Frame = CGRect(x: -((MSDelegate.windowLeftMenu?.width)!), y: 0, width: (MSDelegate.windowLeftMenu?.width)!, height: (MSDelegate.windowLeftMenu?.height)!)
        let windowFrame = CGRect(x: 0, y: 0, width: (MSDelegate.window?.width)!, height: (MSDelegate.window?.height)!)
        UIView.animate(withDuration: 0.2) {
            MSDelegate.windowLeftMenu?.frame = window2Frame
            MSDelegate.window?.frame = windowFrame
        }
    }
    
    func showLeftMenu() {
        let window2Frame = CGRect(x: -((MSDelegate.windowLeftMenu?.width)! * 2 / 3), y: 0, width: (MSDelegate.windowLeftMenu?.width)!, height: (MSDelegate.windowLeftMenu?.height)!)
        let windowFrame = CGRect(x: (MSDelegate.windowLeftMenu?.width)! * 1 / 3, y: 0, width: (MSDelegate.window?.width)!, height: (MSDelegate.window?.height)!)
        UIView.animate(withDuration: 0.2, animations: {
            MSDelegate.windowLeftMenu?.frame = window2Frame
            MSDelegate.window?.frame = windowFrame
        }) { (finish) in
            if (MSDelegate.windowLeftMenu?.isHidden)! {
                MSDelegate.windowLeftMenu?.makeKeyAndVisible()
            }
        }
    }
    
    @objc func openLeftMenu() {
        if isMenuViewOpened {
            closeLeftMenu()
        } else {
            showLeftMenu()
        }
        isMenuViewOpened = !isMenuViewOpened
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
