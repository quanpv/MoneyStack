//
//  MSFirstVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/9/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSFirstVC: MSBaseVC {
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var buttonStartWidth: NSLayoutConstraint!
    
    var firstVM: MSFirstVM {
        return MSFirstVM(self)
    }
    
    override var isStartedScreen: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonStartWidth.constant = UIScreenConstant.WIDTH == 414 ? 200 : 150
        buttonStart.layer.cornerRadius = (UIScreenConstant.WIDTH == 414 ? 200 : 150) / 10
        buttonStart.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionClickStart(_ sender: Any) {
        firstVM.processOpenRegister()
    }
    
}
