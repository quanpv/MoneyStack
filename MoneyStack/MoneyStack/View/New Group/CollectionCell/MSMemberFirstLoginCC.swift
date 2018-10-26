//
//  MSMemberFirstLoginCC.swift
//  MoneyStack
//
//  Created by Pham Van Quan on 10/24/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

protocol MSActionMemberDelegate:class {
    func deleteBtnPressed(index: Int)
    func addBtnPressed()
}

class MSMemberFirstLoginCC: UICollectionViewCell {

    @IBOutlet var btnDeleteMember: UIButton!
    @IBOutlet var btnAddMember: UIButton!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblBirthday: UILabel!
    @IBOutlet var lblGender: UILabel!
    
    var delegate: MSActionMemberDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(_ data: MemberModel)  {
        lblName.text = data.name
        lblBirthday.text = data.birthDay
        lblGender.text = data.gender
    }

    @IBAction func actionDeleteMember(_ sender: Any) {
        delegate?.deleteBtnPressed(index: (sender as! UIButton).tag)
    }
    
    @IBAction func actionAddMemebr(_ sender: Any) {
        delegate?.addBtnPressed()
    }
}
