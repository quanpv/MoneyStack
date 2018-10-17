//
//  MSRegisterVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSRegisterVC: MSBaseVC {

    @IBOutlet weak var textfieldEmail: UITextField!
    @IBOutlet weak var textfieldUserName: UITextField!
    @IBOutlet weak var textfieldFullName: UITextField!
    @IBOutlet weak var textfieldJob: UITextField!
    @IBOutlet weak var textfieldKindOfUser: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    @IBOutlet weak var textfieldRepeatPassword: UITextField!
    @IBOutlet weak var textfieldGender: UITextField!
    @IBOutlet weak var textfieldBirthday: UITextField!
    
    @IBOutlet weak var imageBack: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBack.image = imageBack.image!.withRenderingMode(.alwaysTemplate)
        imageBack.tintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func actionPressBack(_ sender: Any) {
    }
    
    @IBAction func actionPressRegister(_ sender: Any) {
    }
    
    @IBAction func actionPressQuestionMark(_ sender: Any) {
    }
    
    
    
}
