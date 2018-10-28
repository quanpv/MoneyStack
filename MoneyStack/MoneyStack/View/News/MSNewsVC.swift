//
//  MSNewsVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSNewsVC: MSBaseVC {

        @IBOutlet weak var topSpaceOfMainView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustableTopSpace = topSpaceOfMainView

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
