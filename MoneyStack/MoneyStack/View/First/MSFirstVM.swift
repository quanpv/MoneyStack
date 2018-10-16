//
//  MSFirstVM.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

protocol FirstVMProtocol {
    func openRegister()
}

class MSFirstVM: MSNavigationVM {
    func processOpenRegister() {
        let view = MSRegisterVC(nibName: MSRegisterVC.className, bundle: nil)
        self.ownerView?.openView(view)
    }
}
