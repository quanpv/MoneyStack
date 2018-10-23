//
//  MSKindOfMoneyCell.swift
//  MoneyStack
//
//  Created by Squall on 10/23/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSKindOfMoneyCell: UITableViewCell {

    @IBOutlet weak var labelTotalMoney: DesignableLabel!
    @IBOutlet weak var textfieldCash: UITextField!
    @IBOutlet weak var textfieldCashInBank: UITextField!
    @IBOutlet weak var textfieldSavingCash: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
