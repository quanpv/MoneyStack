//
//  MSBaseVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/9/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSBaseVC: UIViewController, MSNavigationVMProtocol {
    
    private var topBarView: MSTopBarView?
    
    private var viewHolder: MSStackOfView? // Root view will own this object
    var isStartedScreen: Bool { return false }
    var navigationVM: MSNavigationVM { return MSNavigationVM(self) }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    //MARK: - Setup viewHolder *IMPORTANT*
    func setupViewHolder() {
        if let _ = viewHolder {
            print("ViewHolder is not null, this is not Root View, dont need to initialize")
        } else {
            viewHolder = MSStackOfView(self)
        }
    }
    
    func setTopBar(_ correctTopBar: MSTopBarView) {
        self.topBarView = correctTopBar
        self.topBarView?.delegate = self
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
}

extension MSBaseVC: MSTopBarViewDelegate {
    
    func topbarLeftClickEvent(type: TopBarType) {
        print("topbarLeftClickEvent")
    }
    
    func topbarRightClickEvent(type: TopBarType) {
        print("topbarRightClickEvent")
    }
    
    func topbarMiddleClickEvent(type: TopBarType) {
        print("topbarMiddleClickEvent")
    }
    
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
