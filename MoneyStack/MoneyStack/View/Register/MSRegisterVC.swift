//
//  MSRegisterVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSRegisterVC: MSBaseVC {

    //Only for corner radius
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var pEmail: UITextField!
    @IBOutlet weak var pUsername: UITextField!
    @IBOutlet weak var pDoubletf: UIView!
    @IBOutlet weak var pBirthday: UIView!
    @IBOutlet weak var pGender: UIView!
    @IBOutlet weak var pFullname: UITextField!
    @IBOutlet weak var pJob: UITextField!
    @IBOutlet weak var pKind: UIView!
    @IBOutlet weak var pPassword: UITextField!
    @IBOutlet weak var pRetype: UITextField!
    @IBOutlet weak var buttonBack: UIView!
    @IBOutlet weak var buttonRegister: UIView!
    //-------------------------------------
    
    @IBOutlet weak var textfieldEmail: UITextField!
    @IBOutlet weak var textfieldUserName: UITextField!
    @IBOutlet weak var textfieldFullName: UITextField!
    @IBOutlet weak var textfieldJob: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    @IBOutlet weak var textfieldRepeatPassword: UITextField!
    
    @IBOutlet weak var labelBirthday: UILabel!
    @IBOutlet weak var labelKind: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    
    @IBOutlet weak var imageQuestionMark: UIButton!
    @IBOutlet weak var imageBack: UIImageView!
    
    private var pickerDataSource:[String] = ["Nam", "Nữ", "Gay", "Lesbian "]
    private var pickerKindDataSource:[String] = ["Cá Nhân", "Gia Đình", "Nhóm"]
    
    let subview = UIView()
    let pickerview = UIPickerView()
    let datePicker = UIDatePicker()
    
    private var kindOfPicker:KindOfPicker = .None
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        imageBack.image = imageBack.image!.withRenderingMode(.alwaysTemplate)
        imageQuestionMark.imageView?.image = imageQuestionMark.imageView?.image!.withRenderingMode(.alwaysTemplate)
        imageBack.tintColor = UIColor.white
        imageQuestionMark.tintColor = UIColor(hex: "#9B111E")
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
    func setup(){
        MSUtils.objectCorner(imageLogo, 6)
        MSUtils.objectCorner(pEmail, 6)
        MSUtils.objectCorner(pUsername, 6)
        MSUtils.objectCorner(pDoubletf, 6)
        MSUtils.objectCorner(pBirthday, 6)
        MSUtils.objectCorner(pGender, 6)
        MSUtils.objectCorner(pFullname, 6)
        MSUtils.objectCorner(pJob, 6)
        MSUtils.objectCorner(pKind, 6)
        MSUtils.objectCorner(pPassword, 6)
        MSUtils.objectCorner(pRetype, 6)
        MSUtils.objectCorner(buttonBack, 6)
        MSUtils.objectCorner(buttonRegister, 6)
        MSUtils.makeViewBorder(buttonRegister, 1, UIColor.white.cgColor)
    }
    
    @objc func dateChanged(sender: UIDatePicker){
        labelBirthday.text = "\(sender.date.getAllAboutDate().day)/\(sender.date.getAllAboutDate().month)/\(sender.date.getAllAboutDate().year)"
        labelBirthday.textColor = UIColor.black
        datePicker.removeFromSuperview()
        subview.removeFromSuperview()
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
        let customDialog = MSAddBalanceInfoDialog(nibName: "MSAddBalanceInfoDialog", bundle: nil)
        customDialog.providesPresentationContextTransitionStyle = true
        customDialog.definesPresentationContext = true
        customDialog.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customDialog.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        customDialog.delegate = self
        self.present(customDialog, animated: true, completion: {
            
        })
    }
    
    @IBAction func actionPressQuestionMark(_ sender: Any) {
    }
    
    @IBAction func actionPressGenderPicker(_ sender: Any) {
        kindOfPicker = .Gender
        pickerview.dataSource = self
        pickerview.delegate = self
        pickerview.showsSelectionIndicator = true
        createSubview(pickerview)
    }
    
    @IBAction func actionPressBirthday(_ sender: Any) {
        createSubview(datePicker)
        datePicker.datePickerMode = .date
        let gregorian: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let currentDate: NSDate = NSDate()
        let components: NSDateComponents = NSDateComponents()
        
        components.year = -18
        let minDate: NSDate = gregorian.date(byAdding: components as DateComponents, to: currentDate as Date, options: NSCalendar.Options(rawValue: 0))! as NSDate
        
        components.year = -150
        let maxDate: NSDate = gregorian.date(byAdding: components as DateComponents, to: currentDate as Date, options: NSCalendar.Options(rawValue: 0))! as NSDate
        
        self.datePicker.minimumDate = minDate as Date
        self.datePicker.maximumDate = maxDate as Date
        
        datePicker.maximumDate = maxDate as Date
        datePicker.minimumDate = minDate as Date
    }
    
    @IBAction func actionPressKindOfUser(_ sender: Any) {
        kindOfPicker = .KindOfUser
        pickerview.dataSource = self
        pickerview.delegate = self
        pickerview.showsSelectionIndicator = true
        createSubview(pickerview)
    }
    
}

//MARK: - Extension PickerView
extension MSRegisterVC:UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch kindOfPicker {
        case .None:
            return 0
        case .Gender:
            return pickerDataSource.count
        case .KindOfUser:
            return pickerKindDataSource.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch kindOfPicker {
        case .None:
            return ""
        case .Gender:
            return pickerDataSource[row]
        case .KindOfUser:
            return pickerKindDataSource[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch kindOfPicker {
        case .None:
            break
        case .Gender:
            labelGender.text = pickerDataSource[row]
            labelGender.textColor = UIColor.black
            
        case .KindOfUser:
            labelKind.text = pickerKindDataSource[row]
            labelKind.textColor = UIColor.black
            
        }
        pickerView.removeFromSuperview()
        subview.removeFromSuperview()
        kindOfPicker = .None
    }
    
}

extension MSRegisterVC:MSBaseDialogDelegate{
    func okButtonPressed() {
        print("1 con vịt xoè ra 2 cái cánh")

    }

    func cancelButtonPressed() {
        print("Nó kêu rằng quác quác quác - quạc quạc quạc")
    }
}
