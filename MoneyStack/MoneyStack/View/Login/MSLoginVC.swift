//
//  MSLoginVC.swift
//  MoneyStack
//
//  Created by Squall on 10/17/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSLoginVC: MSBaseVC {

    //Only for corner radius
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var backBorder: UIView!
    @IBOutlet weak var forwardBorder: UIView!
    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var buttonForgotPassword: UIButton!
    //--------------------------------------
    
    @IBOutlet weak var textfieldUserName: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    
    @IBOutlet weak var imageForward: UIImageView!
    @IBOutlet weak var imageBack: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    private func setupView(){
        imageBack.image = imageBack.image!.withRenderingMode(.alwaysTemplate)
        imageBack.tintColor = UIColor.white
        imageForward.image = imageForward.image!.withRenderingMode(.alwaysTemplate)
        imageForward.tintColor = UIColor.white
        imageForward.transform = CGAffineTransform(rotationAngle: .pi)
        MSUtils.makeViewBorder(forwardBorder, 2, UIColor.white.cgColor)
        MSUtils.objectCorner(imageLogo, 6)
        MSUtils.objectCorner(backBorder, 6)
        MSUtils.objectCorner(forwardBorder, 6)
        MSUtils.objectCorner(buttonRegister, 6)
        MSUtils.objectCorner(buttonForgotPassword, 6)
        MSUtils.objectCorner(textfieldUserName, 6)
        MSUtils.objectCorner(textfieldPassword, 6)
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
