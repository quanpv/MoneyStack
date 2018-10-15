//
//  MSBaseVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/9/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSBaseVC: UIViewController, MSNavigationVMProtocol {
    
    private var viewHolder: MSStackOfView? // Root view will own this object
    
    var navigationVM: MSNavigationVM {
        return MSNavigationVM(self)
    }
    
    // For leftMenu
    var menuView: UITableView?
    var menuBarContainer: UIView?
    var isMenuViewOpened: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewHolder()
    }
    
    //MARK: - Setup viewHolder *IMPORTANT*
    func setupViewHolder() {
        if let _ = viewHolder {
            print("ViewHolder is not null, this is not Root View")
        } else {
            viewHolder = MSStackOfView(self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - MSNavigationVMProtocol
    func openView(_ view: MSBaseVC, animated: Bool) {
        self.viewHolder?.push(view)
        view.viewHolder = self.viewHolder // new view will refer/point to this stack of view, to use later
        MSDelegate.window?.swapRootViewControllerWithAnimation(newViewController: view, animationType: .push)
    }
    
    func selfClose(animated: Bool) {
        self.viewHolder?.doPop()
        let newLastView = self.viewHolder?.getLast()
        MSDelegate.window?.swapRootViewControllerWithAnimation(newViewController: newLastView!, animationType: .pop)
    }
    
    func closeToRoot(animated: Bool) {
        let rootView = self.viewHolder?.getLast()
        MSDelegate.window?.swapRootViewControllerWithAnimation(newViewController: rootView!, animationType: .pop)
    }
    
    func closeToView(_ view: MSBaseVC, animated: Bool) {
        // TODO
    }
}
