//
//  MSFirstVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/9/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSFirstVC: MSBaseVC {
    @IBOutlet weak var buttonStart: UIButton!
    
    var firstVM: MSFirstVM {
        return MSFirstVM(self)
    }
    
    override var isStartedScreen: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonStart.setImage(UIImage(named: "ic_dollar_1")?.withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
        buttonStart.tintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func actionClickStart(_ sender: Any) {
        firstVM.processOpenRegister()
    }
    
}
