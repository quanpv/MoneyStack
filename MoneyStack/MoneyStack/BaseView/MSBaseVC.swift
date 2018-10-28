//
//  MSBaseVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/9/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSBaseVC: UIViewController, MSNavigationVMProtocol {
    
    var topBarContainer: UIView?
    var topBarView: MSTopBarView?
    var adjustableTopSpace: NSLayoutConstraint?
    @IBInspectable var topBarType: Int = 0 // 0 is None
    
    var backGroundImage: UIImageView = UIImageView()
    var darkerView = UIView()
    let darkViewAlpha: CGFloat = 0.5

    private var viewHolder: MSStackOfView? // Root view will own this object
    var isStartedScreen: Bool { return false }
    var navigationVM: MSNavigationVM { return MSNavigationVM(self) }
    
    var currentOffset: CGPoint = CGPoint.zero
    var isScrollUp: Bool = false
    
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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {//            let temp = scrollView.contentOffset.y >= currentOffset.y
//            print("\(scrollView.contentOffset.y) - \(currentOffset.y)")
//            currentOffset.y = scrollView.contentOffset.y >= 0 ? scrollView.contentOffset.y : 0
//            if temp == isScrollUp { return } else { isScrollUp = temp }
//            if isScrollUp { // Scroll up
//                self.heightOfTopBar?.constant = 0
//                self.topBarView?.isHidden = true
//            } else { // Scroll down
//                self.heightOfTopBar?.constant = MSBaseVCConstant.HEIGHT_TOP_MENU_BAR
//                self.topBarView?.isHidden = false
//            }

//            if scrollView.contentOffset.y >= (heightOfTopBar?.constant)! {
//                if heightOfTopBar?.constant != 0 {
//                    UIView.animate(withDuration: 0.4, animations: {
//                        self.heightOfTopBar?.constant = 0
//                    }) { (success) in
//                        self.topBarView?.isHidden = true
//                    }
//                }
//            } else {
//                if heightOfTopBar?.constant != MSBaseVCConstant.HEIGHT_TOP_MENU_BAR {
//                    UIView.animate(withDuration: 0.4, animations: {
//                        self.heightOfTopBar?.constant = MSBaseVCConstant.HEIGHT_TOP_MENU_BAR
//                    }) { (success) in
//                        self.topBarView?.isHidden = false
//                    }
//                }
//            }
        
    }
}
