//
//  AppDelegateExtension.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    var leftMenuXOpen: CGFloat { return -(UIScreenConstant.WIDTH * (1 - MSLeftMenuVCConstant.SHOWING_WIDTH_RATIO)) }
    var leftMenuXClose: CGFloat { return -UIScreenConstant.WIDTH }
    var mainWindowXClose: CGFloat { return UIScreenConstant.WIDTH * MSLeftMenuVCConstant.SHOWING_WIDTH_RATIO }

    func onDidFinishLaunching(_ application: UIApplication, _ launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        createLeftMenuItem()
    }
    
    func createLeftMenuItem() {
        leftMenuItemAndRootView = [
            ["Item1": MSFirstVC(nibName: MSFirstVC.className, bundle: nil)],
            ["Item2": MSFirstVC(nibName: MSFirstVC.className, bundle: nil)],
            ["Item3": MSFirstVC(nibName: MSFirstVC.className, bundle: nil)]
        ]
    }
    
    func closeLeftMenu() {
        let window2Frame = CGRect(x: leftMenuXClose, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        let windowFrame = CGRect(x: 0, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.windowLeftMenu?.frame = window2Frame
            self.window?.frame = windowFrame
        }) { (finish) in
            self.window?.makeKey()
        }
    }
    
    func showLeftMenu() {
        let window2Frame = CGRect(x: leftMenuXOpen, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        let windowFrame = CGRect(x: mainWindowXClose, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        UIView.animate(withDuration: 0.2, animations: {
            self.windowLeftMenu?.frame = window2Frame
            self.window?.frame = windowFrame
        }) { (finish) in
            if (self.windowLeftMenu?.isHidden)! {
                self.windowLeftMenu?.makeKeyAndVisible()
            } else {
                self.windowLeftMenu?.makeKey()
            }
        }
    }
    
    func openLeftMenu() {
        if (windowLeftMenu?.isKeyWindow)! {
            closeLeftMenu()
        } else {
            showLeftMenu()
        }
    }
    
    func onLeftMenuClicked(index: Int) {
        window?.rootViewController = leftMenuItemAndRootView[index].values.first as? UIViewController
        closeLeftMenu()
    }
}
