//
//  MSConfirmDialog.swift
//  MoneyStack
//
//  Created by Squall on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSConfirmDialog: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var dialogView: UIView!
    
    @IBOutlet weak var imageX: UIImageView!
    @IBOutlet weak var imageTick: UIImageView!
    
    //For corner radius
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var cancelView: UIView!
    //---------------------------------------------
    
    var delegate:MSBaseDialogDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated:Bool){
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    
    func setupView(){
        MSUtils.objectCorner(headerView, 6)
        MSUtils.objectCorner(bodyView, 6)
        MSUtils.objectCorner(footerView, 6)
        MSUtils.objectCorner(cancelView, 6)
        
        MSUtils.makeViewBorder(footerView, 1, UIColor.white.cgColor)
        MSUtils.makeViewBorder(bodyView, 1, UIColor.black.cgColor)
        
//        imageX.image = imageX.image!.withRenderingMode(.alwaysTemplate)
//        imageTick.image = imageTick.image!.withRenderingMode(.alwaysTemplate)
//        imageX.tintColor = UIColor.white
//        imageTick.tintColor = UIColor.white
    }
    
    func animateView(){
        dialogView.alpha = 0
        self.dialogView.frame.origin.y = self.dialogView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.dialogView.alpha = 1.0;
            self.dialogView.frame.origin.y = self.dialogView.frame.origin.y - 50
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func actionPressCancel(_ sender: Any) {
        delegate?.cancelButtonPressed()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func actionPressOk(_ sender: Any) {
        delegate?.okButtonPressed()
        self.dismiss(animated: true, completion: {
            
        })
    }
    @IBAction func actionPressBackground(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
}
