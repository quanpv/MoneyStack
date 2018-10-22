//
//  MSDashboardCC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/21/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSDashboardCC: UICollectionViewCell {
    @IBOutlet weak var labelMoney: UILabel!
    @IBOutlet weak var labelDate: MSCornerLabel!
    @IBOutlet weak var labelContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func clickDetail(_ sender: Any) {
    }
}
