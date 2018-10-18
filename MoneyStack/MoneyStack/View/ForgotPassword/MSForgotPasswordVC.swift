//
//  MSForgotPasswordVC.swift
//  MoneyStack
//
//  Created by Squall on 10/18/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSForgotPasswordVC: MSBaseVC {

    @IBOutlet weak var textfieldUsername: UITextField!
    @IBOutlet weak var textfieldCode: UITextField!
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var imageForward: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageBack.image = imageBack.image!.withRenderingMode(.alwaysTemplate)
        imageForward.image = imageForward.image!.withRenderingMode(.alwaysTemplate)
        imageBack.tintColor = UIColor.white
        imageForward.tintColor = UIColor.white
        imageForward.transform = CGAffineTransform(rotationAngle: .pi/2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    @IBAction func actionPressBack(_ sender: Any) {
    }
    
    
    @IBAction func actionPressForward(_ sender: Any) {
    }
    
}
