//
//  MSAddMemberDialog.swift
//  MoneyStack
//
//  Created by Pham Van Quan on 10/25/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

enum PickerType: Int {
    case DatePicker = 1,
    PickerView
}

protocol SubmitDataMemberDelegate {
    func submitMember(_ data: MemberModel)
  
}

class MSAddMemberDialog: UIViewController {

    @IBOutlet var txtFieldName: UITextField!
    @IBOutlet var btnBirthday: UIButton!
    @IBOutlet var btnGender: UIButton!
    let placeHolder = UIButton()
    var pickerViewGender = UIPickerView()
    var datePicker = UIDatePicker()
    let dataGender = ["Nam", "Nữ", "Không xác định"]
    
    let heightPicker: CGFloat = 200.0
    var memberModel = MemberModel()
    var delegate : SubmitDataMemberDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createPickerView(_ pickerView:UIView) {
        placeHolder.frame = CGRect(x: 0, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        placeHolder.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        placeHolder.addTarget(self, action: #selector(MSAddMemberDialog.actionDismissPickerView(_:)), for: UIControlEvents.touchUpInside)
        pickerView.frame = CGRect(x: 0, y: UIScreenConstant.HEIGHT-heightPicker, width: UIScreenConstant.WIDTH, height: heightPicker)
        pickerView.backgroundColor = UIColor.white
        pickerView.layer.shadowRadius = 4
        //
        //ToolBar
//        let toolbar = UIToolbar();
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
//
//        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
//        toolbar.frame =  CGRect(x: 0, y: UIScreenConstant.HEIGHT-heightPicker-toolbar.height, width: UIScreenConstant.WIDTH, height: toolbar.height)
//        placeHolder.addSubview(toolbar)
        placeHolder.addSubview(pickerView)
        view.addSubview(placeHolder)
    }

    func createDatePicker() {
        //Formate Date
        datePicker.datePickerMode = .date
        
        placeHolder.frame = CGRect(x: 0, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        placeHolder.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        placeHolder.addTarget(self, action: #selector(MSAddMemberDialog.actionDismissPickerView(_:)), for: UIControlEvents.touchUpInside)
        datePicker.frame = CGRect(x: 0, y: UIScreenConstant.HEIGHT-heightPicker, width: UIScreenConstant.WIDTH, height: heightPicker)
        datePicker.backgroundColor = UIColor.white
        datePicker.layer.shadowRadius = 4
        //
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        toolbar.frame =  CGRect(x: 0, y: UIScreenConstant.HEIGHT-heightPicker-toolbar.height, width: UIScreenConstant.WIDTH, height: toolbar.height)
        toolbar.tag = 100
        placeHolder.addSubview(toolbar)
        placeHolder.addSubview(datePicker)
        view.addSubview(placeHolder)
    }
    
    func removeAllPicker() {
        if let toolbarWithTag = self.placeHolder.viewWithTag(100) {
            toolbarWithTag.removeFromSuperview()
        }
        pickerViewGender.removeFromSuperview()
        datePicker.removeFromSuperview()
        placeHolder.removeFromSuperview()
    }
    
    @objc func doneDatePicker() {
           print("actionDone======>")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let sDate = formatter.string(from: datePicker.date)
        btnBirthday.setTitle(sDate, for: UIControlState.normal)
        self.memberModel.birthDay = sDate
        removeAllPicker()
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
           print("actionCancel======>")
        removeAllPicker()
        self.view.endEditing(true)
    }
    
 @objc func actionDismissPickerView(_ sender:UIButton)  {
    removeAllPicker()
        print("actionDismiss======>")
    }
    
    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    
    @IBAction func actionDone(_ sender: Any) {
        memberModel.name = txtFieldName.text
        delegate?.submitMember(memberModel)
        self.dismiss(animated: true, completion: {
            
        })
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    
    @IBAction func actionBirthday(_ sender: Any) {
        createDatePicker()
    }
    @IBAction func actionGender(_ sender: Any) {
        pickerViewGender.delegate = self
        createPickerView(pickerViewGender)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MSAddMemberDialog: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataGender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataGender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        btnGender.titleLabel?.text = ""
        btnGender.setTitle(dataGender[row], for: UIControlState.normal)
        memberModel.gender = dataGender[row]
    }
}
