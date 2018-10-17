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
    @IBOutlet weak var labelBirthday: UILabel!
    
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var imageQuestionMark: UIButton!
    @IBOutlet weak var imageBack: UIImageView!
    
    private var pickerDataSource:[String] = ["Nam", "Nữ", "Gay", "Lesbian "]
    
    let subview = UIView()
    let pickerview = UIPickerView()
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBack.image = imageBack.image!.withRenderingMode(.alwaysTemplate)
        imageQuestionMark.imageView?.image = imageQuestionMark.imageView?.image!.withRenderingMode(.alwaysTemplate)
        imageBack.tintColor = UIColor.white
        imageQuestionMark.tintColor = UIColor(hex: "#00A6FF")
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }

    @objc func dateChanged(sender: UIDatePicker){
        labelBirthday.text = "\(sender.date.getAllAboutDate().day)/\(sender.date.getAllAboutDate().month)/\(sender.date.getAllAboutDate().year)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func createSubview(_ viewChild: UIView){
        let subviewWidth = UIScreen.main.bounds.width
        subview.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 150, width: subviewWidth, height: 150)
        viewChild.frame = CGRect(x: 0, y: 0, width: subviewWidth, height: 150)
        subview.backgroundColor = UIColor.white
        subview.layer.shadowColor = UIColor.black.cgColor
        subview.layer.shadowOffset = CGSize(width: 0, height: 1)
        subview.layer.shadowOpacity = 1
        subview.layer.shadowRadius = 4
        subview.addSubview(viewChild)
        view.addSubview(subview)
        
    }
    
    //MARK: - Action Handler
    @IBAction func actionPressBack(_ sender: Any) {
    }
    
    @IBAction func actionPressRegister(_ sender: Any) {
    }
    
    @IBAction func actionPressQuestionMark(_ sender: Any) {
    }
    
    @IBAction func actionPressGenderPicker(_ sender: Any) {
        pickerview.dataSource = self
        pickerview.delegate = self
        pickerview.showsSelectionIndicator = true
        createSubview(pickerview)
    }
    
    @IBAction func actionPressBirthday(_ sender: Any) {
        createSubview(datePicker)
        datePicker.datePickerMode = .dateAndTime
        datePicker.minimumDate = Date.calculateDate(day: 1, month: 1, year: 1900)
        datePicker.maximumDate = Date.calculateDate(day: 31, month: 12, year: 2018)
    }
}

//MARK: - Extension PickerView
extension MSRegisterVC:UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelGender.text = pickerDataSource[row]
        labelGender.textColor = UIColor.black
        subview.removeFromSuperview()
    }
    
}
