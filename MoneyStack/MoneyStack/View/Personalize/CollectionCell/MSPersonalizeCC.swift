//
//  MSPersonalizeCC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/21/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSPersonalizeCC: UICollectionViewCell {
    
    @IBOutlet weak var mainColorView: UIView!
    @IBOutlet weak var subColorView: UIView!
    @IBOutlet weak var imageCheck: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageCheck.layer.cornerRadius = imageCheck.bounds.height / 2
        imageCheck.clipsToBounds = true
        imageCheck.layer.borderColor = UIColor.white.cgColor
        imageCheck.layer.borderWidth = 5
    }

}
