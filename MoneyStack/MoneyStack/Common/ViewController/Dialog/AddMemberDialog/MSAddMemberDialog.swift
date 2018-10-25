//
//  MSAddMemberDialog.swift
//  MoneyStack
//
//  Created by Pham Van Quan on 10/25/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSAddMemberDialog: UIViewController {

    @IBOutlet var btnGender: UIButton!
    let placeHolder = UIButton()
    var pickerViewGender = UIPickerView()
    let dataGender = ["Nam", "Nữ", "Gay"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createPickerView(_ pickerView:UIPickerView) {
        placeHolder.frame = CGRect(x: 0, y: 0, width: UIScreenConstant.WIDTH, height: UIScreenConstant.HEIGHT)
        placeHolder.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        placeHolder.addTarget(self, action: #selector(MSAddMemberDialog.actionDismissPickerView(_:)), for: UIControlEvents.touchUpInside)
        pickerView.frame = CGRect(x: 0, y: UIScreenConstant.HEIGHT-200, width: UIScreenConstant.WIDTH, height: 200)
        pickerView.backgroundColor = UIColor.white
        pickerView.layer.shadowRadius = 4
        placeHolder.addSubview(pickerView)
        view.addSubview(placeHolder)
    }
    
 @objc func actionDismissPickerView(_ sender:UIButton)  {
        placeHolder.removeFromSuperview()
        print("actionDismiss======>")
    }
    
    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    
    @IBAction func actionDone(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
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
    }
}
