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
    
    /** enum LeftMenuItem: Int {
        case Dashboard,
        News,
        Expense,
        BalanceInfo,
        Saving,
        Plan,
        Member,
        Personalize,
        Password,
        Logout
        }
    */
    func createLeftMenuItem() {
        leftMenuItemAndRootView.append(contentsOf: [
            ["Trang chủ": MSDashboardVC.loadFromNib()],
            ["Tin tức": MSNewsVC.loadFromNib()],
            ["Chi tiêu": MSExpenseVC.loadFromNib()],
            ["Tiền": MSBalanceInfoVC.loadFromNib()],
            ["Tiết kiệm": MSSavingVC.loadFromNib()],
            ["Dự định": MSPlanVC.loadFromNib()],
            ["Thành viên": MSMemberVC.loadFromNib()],
            ["Cá nhân hoá": MSPersonalizeVC.loadFromNib()],
            ["Mật khẩu": MSPasswordVC.loadFromNib()],
            ["Đăng xuất": LeftMenuItem.Logout]
        ])
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
        let obj = leftMenuItemAndRootView[index].values.first
        if let vc: MSBaseVC = obj as? MSBaseVC {
            window?.rootViewController = vc
        }
        if let actionItem = obj as? LeftMenuItem {
            switch actionItem {
            case .Logout:
                print("User click logout, move to Login screen")
                logOut()
                moveToLoginScreen()
            
            default: break
            }
        }
        closeLeftMenu()
    }
    
    func logOut() {
        leftMenuItemAndRootView.removeAll()
        createLeftMenuItem()
    }
    
    func moveToLoginScreen() {
        window?.rootViewController = MSLoginVC.loadFromNib()
    }
    
    func moveToRegisterScreen(){
        window?.rootViewController = MSRegisterVC.loadFromNib()
    }
}
