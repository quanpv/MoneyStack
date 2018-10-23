//
//  MSBaseVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/9/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSBaseVC: UIViewController, MSNavigationVMProtocol {
    
    var topBarView: MSTopBarView?
    var heightOfTopBar: NSLayoutConstraint?
    
    var backGroundImage: UIImageView = UIImageView()
    var darkerView = UIView()
    let darkViewAlpha: CGFloat = 0.5

    private var viewHolder: MSStackOfView? // Root view will own this object
    var isStartedScreen: Bool { return false }
    var navigationVM: MSNavigationVM { return MSNavigationVM(self) }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad()
        setupNotificationObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Setup viewHolder *IMPORTANT*
    func setupViewHolder() {
        if let _ = viewHolder {
            print("ViewHolder is not null, this is not Root View, dont need to initialize")
        } else {
            viewHolder = MSStackOfView(self)
        }
    }
    
    func setupNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleChangeTheme(notification:)), name: NotificationChangeTheme, object: nil)
    }
    
    @objc func handleChangeTheme(notification: Notification) {
        topBarView?.updateColor()
        darkerView.backgroundColor = MSDelegate.config.mainColor.withAlphaComponent(darkViewAlpha)
    }
    
    func setTopBar(_ correctTopBar: MSTopBarView, _ height: NSLayoutConstraint) {
        self.topBarView = correctTopBar
        self.topBarView?.delegate = self
        self.heightOfTopBar = height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - MSNavigationVMProtocol
    func openView(_ view: MSBaseVC, animated: Bool = true) {
        self.viewHolder?.push(view)
        view.viewHolder = self.viewHolder // new view will refer/point to this stack of view, to use later
        MSDelegate.window?.swapRootViewControllerWithAnimation(newViewController: view, animationType: .push)
    }
    
    func selfClose(animated: Bool = true) {
        self.viewHolder?.doPop()
        let newLastView = self.viewHolder?.getLast()
        MSDelegate.window?.swapRootViewControllerWithAnimation(newViewController: newLastView!, animationType: .pop)
    }
    
    func closeToRoot(animated: Bool = true) {
        let rootView = self.viewHolder?.getLast()
        MSDelegate.window?.swapRootViewControllerWithAnimation(newViewController: rootView!, animationType: .pop)
    }
    
    func closeToView(_ view: MSBaseVC, animated: Bool = true) {
        //MARK: - TODO closeToView
    }
    
    //MARK: - Handler for TopBar Click Event
    func topbarLeftClickEvent(type: TopBarType) {
        print("topbarLeftClickEvent")
    }
    
    func topbarRightClickEvent(type: TopBarType) {
        print("topbarRightClickEvent")
    }
    
    func topbarMiddleClickEvent(type: TopBarType) {
        print("topbarMiddleClickEvent")
    }
}

extension MSBaseVC: MSTopBarViewDelegate {
    
    func clickTopBar(position: TopBarPosition) {
        switch position {
        case .Left:
            switch topBarView!.topBarType {
            case .Menu, .Menu_Filter:
                MSDelegate.openLeftMenu()
            default:
                topbarLeftClickEvent(type: topBarView!.topBarType)
            }
        case .Right:
            topbarRightClickEvent(type: topBarView!.topBarType)
        case .Middle:
            topbarMiddleClickEvent(type: topBarView!.topBarType)
        }
    }
}

extension MSBaseVC: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y > (heightOfTopBar?.constant)! {
//            if heightOfTopBar?.constant != 0 { heightOfTopBar?.constant = 0 }
//        } else {
//            if heightOfTopBar?.constant != MSBaseVCConstant.HEIGHT_TOP_MENU_BAR { heightOfTopBar?.constant = MSBaseVCConstant.HEIGHT_TOP_MENU_BAR }
//        }
//    }
}
