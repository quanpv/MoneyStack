//
//  MSMemberFirstLoginCC.swift
//  MoneyStack
//
//  Created by Pham Van Quan on 10/24/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

protocol MSActionMemberDelegate:class {
    func deleteBtnPressed()
    func addBtnPressed()
}

class MSMemberFirstLoginCC: UICollectionViewCell {

    @IBOutlet var btnAddMember: UIButton!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblBirthday: UILabel!
    @IBOutlet var lblGender: UILabel!
    
    var delegate: MSActionMemberDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBAction func actionDeleteMember(_ sender: Any) {
    }
    
    @IBAction func actionAddMemebr(_ sender: Any) {
        delegate?.addBtnPressed()
    }
}
