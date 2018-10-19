//
//  MSExpenseVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSExpenseVC: MSBaseVC {
    @IBOutlet weak var topBar: MSTopBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MSExpenseVC: MSTopBarViewDelegate {
    func clickTopBar(position: TopBarPosition) {
        switch position {
        case .Left:
            MSDelegate.openLeftMenu()
        case .Right:
            print("Clicked at Topbar's Right Position")
        //MARK: - TODO: Open [Filter Combobox]
        case .Middle:
            break
        }
    }
}

