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
        //createLeftMenuItem()
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
            ["Trang chủ": MSDashboardVC(nibName: MSDashboardVC.className, bundle: nil)],
            ["Tin tức": MSNewsVC(nibName: MSNewsVC.className, bundle: nil)],
            ["Chi tiêu": MSExpenseVC(nibName: MSExpenseVC.className, bundle: nil)],
            ["Tiền": MSViewBalanceInfoVC(nibName: MSViewBalanceInfoVC.className, bundle: nil)],
            ["Tiết kiệm": MSSavingVC(nibName: MSSavingVC.className, bundle: nil)],
            ["Dự định": MSPlanVC(nibName: MSPlanVC.className, bundle: nil)],
            ["Thành viên": MSMemberVC(nibName: MSMemberVC.className, bundle: nil)],
            ["Cá nhân hoá": MSPersonalizeVC(nibName: MSPersonalizeVC.className, bundle: nil)],
            ["Mật khẩu": MSPasswordVC(nibName: MSPasswordVC.className, bundle: nil)],
            ["Đăng xuất": LeftMenuItem.Logout]
        ])
        darkerView = UIButton(frame: UIScreenConstant.BOUNDS)
        darkerView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        darkerView.addTarget(self, action: #selector(closeLeftMenu), for: .touchUpInside)
    }
    
    @objc func closeLeftMenu() {
        let window2Frame = CGRect(x: leftMenuXClose, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        let windowFrame = CGRect(x: 0, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.windowLeftMenu?.frame = window2Frame
            self.window?.frame = windowFrame
        }) { (finish) in
            self.window?.makeKey()
            self.darkerView.removeFromSuperview()
        }
    }
    
    func showLeftMenu() {
        let window2Frame = CGRect(x: leftMenuXOpen, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        let windowFrame = CGRect(x: mainWindowXClose, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        window?.addSubview(darkerView)
        if (self.windowLeftMenu?.isHidden)! {
            self.windowLeftMenu?.isHidden = false
        }
        UIView.animate(withDuration: 0.2, animations: {
            self.windowLeftMenu?.frame = window2Frame
            self.window?.frame = windowFrame
        }) { (finish) in
            self.windowLeftMenu?.makeKey()
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
        let key: String = (leftMenuItemAndRootView[index].keys.first)!
        let obj = leftMenuItemAndRootView[index][key]
        if obj is UIViewController {
            window?.rootViewController = (obj as! UIViewController)
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
        window?.rootViewController = MSLoginVC(nibName: MSLoginVC.className, bundle: nil)
    }
    
    func moveToMainScreen() {
        createLeftMenuItem()
        onLeftMenuClicked(index: LeftMenuItem.Dashboard.rawValue)
    }
    
    func moveToRegisterScreen(){
        window?.rootViewController = MSRegisterVC(nibName: MSRegisterVC.className, bundle: nil)
    }
}
