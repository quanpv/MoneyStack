//
//  AppDelegateExtension.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    static var leftMenuContent = [
        ["Item1": MSFirstVC(nibName: MSFirstVC.className, bundle: nil)],
        ["Item2": MSFirstVC(nibName: MSFirstVC.className, bundle: nil)],
        ["Item3": MSFirstVC(nibName: MSFirstVC.className, bundle: nil)]
    ]
    
    func onDidFinishLaunching(_ application: UIApplication, _ launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
    }
}
