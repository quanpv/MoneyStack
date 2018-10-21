//
//  MSAddBalanceInfoDialog.swift
//  MoneyStack
//
//  Created by Squall on 10/20/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSAddBalanceInfoDialog: UIViewController {
    
    @IBOutlet weak var imageTick: UIImageView!
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textfieldMoney: UITextField!
    @IBOutlet weak var labelKind: UILabel!
    @IBOutlet weak var dialog: UIView!
    //Only for corner radius
    @IBOutlet weak var dialogFooter: UIView!
    @IBOutlet weak var kindView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var moneyView: UIView!
    @IBOutlet weak var dialogHeader: UIView!
    @IBOutlet weak var buttonCancel: UIView!
    
    //----------------------------------------------------
    private var pickerDataSourse:[String] = ["Tiền", "Tài Sản"]
    let pickerView = UIPickerView()
     let subview = UIView()
    var delegate:MSBaseDialogDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }

    private  func setupView() {
        MSUtils.objectCorner(dialogFooter, 6)
        MSUtils.objectCorner(kindView, 6)
        MSUtils.objectCorner(nameView, 6)
        MSUtils.objectCorner(moneyView, 6)
        MSUtils.objectCorner(dialogHeader, 6)
        MSUtils.objectCorner(buttonCancel, 6)
        MSUtils.makeViewBorder(dialogFooter, 2, UIColor.white.cgColor)
        imageTick.image = imageTick.image!.withRenderingMode(.alwaysTemplate)
        imageTick.tintColor = UIColor.white
        
        buttonCancel.backgroundColor = MSDelegate.config.mainColor
        dialogFooter.backgroundColor = MSDelegate.config.subColor
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

    @IBAction  func actionPressCancel(_ sender: Any) {
        delegate?.cancelButtonPressed()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction  func actionPressOk(_ sender: Any) {
        delegate?.okButtonPressed()
        self.dismiss(animated: true, completion: {
            
        })
    }
    
    @IBAction func actionPressPickerView(_ sender: Any) {
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.showsSelectionIndicator = true
        let subviewWidth = UIScreen.main.bounds.width
        subview.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 200, width: subviewWidth, height: 200)
        pickerView.frame = CGRect(x: 0, y: 0, width: subviewWidth, height: 200)
        subview.backgroundColor = UIColor.white
        subview.layer.shadowColor = UIColor.black.cgColor
        subview.layer.shadowOffset = CGSize(width: 0, height: 1)
        subview.layer.shadowOpacity = 1
        subview.layer.shadowRadius = 4
        subview.addSubview(pickerView)
        view.addSubview(subview)
    }
    
    @IBAction func actionPressBackground(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    
}

extension MSAddBalanceInfoDialog: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return pickerDataSourse.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSourse[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelKind.text = pickerDataSourse[row]
        labelKind.textColor = UIColor.black
        pickerView.removeFromSuperview()
        subview.removeFromSuperview()
    }
    
}
