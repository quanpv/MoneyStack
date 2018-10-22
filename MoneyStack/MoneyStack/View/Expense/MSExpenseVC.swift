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
    @IBOutlet weak var topBarHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTopBar(topBar,topBarHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
