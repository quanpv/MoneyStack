//
//  MSDashboardVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSDashboardVC: MSBaseVC {
    
    @IBOutlet weak var topBar: MSTopBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickMoneyBag(_ sender: Any) {
        //MARK: - TODO: Open [View Balance info]
    }
    
    @IBAction func clickPlus(_ sender: Any) {
        //MARK: - TODO: Open [Expense - Add Record]
    }
    
    @IBAction func actionCollapse(_ sender: Any) {
        //MARK: - TODO: actionCollapse
    }
}

extension MSDashboardVC: MSTopBarViewDelegate {
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
