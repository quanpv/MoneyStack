//
//  MSEditBalanceInfoDialog.swift
//  MoneyStack
//
//  Created by Squall on 10/22/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSEditBalanceInfoDialog: UIViewController {
    let pickerView = UIPickerView()
    let subview = UIView()
    var delegate:MSBaseDialogDelegate?
    
    @IBOutlet weak var dialog: UIView!
    
    @IBOutlet weak var labelOldName: UILabel!
    @IBOutlet weak var labelNewName: UILabel!
    @IBOutlet weak var labelOldValue: UILabel!
    @IBOutlet weak var labelNewValue: UILabel!
    @IBOutlet weak var labelChange: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateView()
    }
    
    private func animateView(){
        dialog.alpha = 0
        self.dialog.frame.origin.y = self.dialog.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.dialog.alpha = 1.0;
            self.dialog.frame.origin.y = self.dialog.frame.origin.y - 50
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
    
}
