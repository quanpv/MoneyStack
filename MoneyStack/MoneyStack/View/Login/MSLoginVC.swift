//
//  MSLoginVC.swift
//  MoneyStack
//
//  Created by Squall on 10/17/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSLoginVC: MSBaseVC {

    @IBOutlet weak var textfieldUserName: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    //MARK: - ACTION HANDLER
    @IBAction func actionPressBack(_ sender: Any) {
    }
    
    @IBAction func actionPressLogin(_ sender: Any) {
    }
    
    @IBAction func actionPressRegister(_ sender: Any) {
    }
   
    @IBAction func actionPressForgotPassword(_ sender: Any) {
    }
}
