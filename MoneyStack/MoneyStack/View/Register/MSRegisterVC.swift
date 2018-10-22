//
//  MSRegisterVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSRegisterVC: MSBaseVC {
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var textfieldEmail: UITextField!
    @IBOutlet weak var textfieldUserName: UITextField!
    @IBOutlet weak var textfieldBirthday: UITextField!
    
    @IBOutlet weak var textfieldFullName: UITextField!
    @IBOutlet weak var textfieldJob: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    @IBOutlet weak var textfieldRepeatPassword: UITextField!
    

    @IBOutlet weak var labelKind: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    
    @IBOutlet weak var imageQuestionMark: UIButton!
    
    private var pickerDataSource:[String] = ["Nam", "Nữ"]
    private var pickerKindDataSource:[String] = ["Cá Nhân", "Gia Đình", "Nhóm"]
    
    let subview = UIView()
    let pickerview = UIPickerView()
    let datePicker = UIDatePicker()
    
    private var kindOfPicker:KindOfPicker = .None
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func createSubview(_ viewChild: UIView){
        let subviewWidth = UIScreen.main.bounds.width
        subview.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 200, width: subviewWidth, height: 200)
        viewChild.frame = CGRect(x: 0, y: 0, width: subviewWidth, height: 200)
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
        self.navigationVM.closeCurrent()
    }
    
    @IBAction func actionPressRegister(_ sender: Any) {
//        let customDialog = MSAddBalanceInfoDialog(nibName: "MSAddBalanceInfoDialog", bundle: nil)
//        customDialog.providesPresentationContextTransitionStyle = true
//        customDialog.definesPresentationContext = true
//        customDialog.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        customDialog.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        customDialog.delegate = self
//        self.present(customDialog, animated: true, completion: {
//            MSDelegate.moveToMainScreen()
//        })
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
    
    @IBAction func actionPressKindOfUser(_ sender: Any) {
        kindOfPicker = .KindOfUser
        pickerview.dataSource = self
        pickerview.delegate = self
        pickerview.showsSelectionIndicator = true
        createSubview(pickerview)
    }
    
    @IBAction func checkValidate(_ sender: UITextField) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let checkString = sender.text
        if dateFormatter.date(from: checkString!) != nil {
            
        }else{
            //Invalid
        }
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

//extension MSRegisterVC:MSBaseDialogDelegate{
//    func okButtonPressed() {
//        print("1 con vịt xoè ra 2 cái cánh")
//
//    }
//
//    func cancelButtonPressed() {
//        print("Nó kêu rằng quác quác quác - quạc quạc quạc")
//    }
//}


