//
//  MSLeftMenuCell.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/15/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSLeftMenuCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var trailingSpace: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
