//
//  MSFirstBalanceInfoVC.swift
//  MoneyStack
//
//  Created by Pham Van Quan on 10/18/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSFirstBalanceInfoVC: MSBaseVC {

    @IBOutlet var txtFieldTN: UITextField!
    
    @IBOutlet var txtFieldTM: UITextField!
    
    @IBOutlet var btnSave: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        
            }
    
//    func processOpenFirstBalanceInfo() {
//        let view = MSFirstBalanceInfoVC(nibName: MSFirstBalanceInfoVC.className, bundle: nil)
//        self.ownerView?.openView(view)
//    }

    
    @IBAction func saveAction(_ sender: Any) {
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
