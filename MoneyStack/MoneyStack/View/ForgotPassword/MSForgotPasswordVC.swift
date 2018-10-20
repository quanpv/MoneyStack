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
    @IBOutlet weak var imageLogo: UIImageView!
    
    //For corner radius only
    @IBOutlet weak var btnBack: UIView!
    @IBOutlet weak var btnForward: UIView!
    //--------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MSUtils.objectCorner(imageLogo, 7.5)
        MSUtils.objectCorner(btnBack, 6)
        MSUtils.objectCorner(btnForward, 6)
        MSUtils.objectCorner(textfieldUsername, 6)
        MSUtils.objectCorner(textfieldCode, 6)
        
        
//        imageBack.image = imageBack.image!.withRenderingMode(.alwaysTemplate)
//        imageForward.image = imageForward.image!.withRenderingMode(.alwaysTemplate)
//        imageBack.tintColor = UIColor.white
//        imageForward.tintColor = UIColor.white
//        imageForward.transform = CGAffineTransform(rotationAngle: .pi)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    @IBAction func actionPressBack(_ sender: Any) {
    }
    
    
    @IBAction func actionPressForward(_ sender: Any) {
    }
    
}
