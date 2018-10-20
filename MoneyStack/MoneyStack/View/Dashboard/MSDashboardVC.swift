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
        self.setTopBar(topBar)
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
