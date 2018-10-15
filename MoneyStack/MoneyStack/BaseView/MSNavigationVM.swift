//
//  MSNavigationVM.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/9/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

protocol MSNavigationVMProtocol {
    func openView(_ view: MSBaseVC, animated: Bool)
    func selfClose(animated: Bool)
    func closeToRoot(animated: Bool)
    func closeToView(_ view: MSBaseVC, animated: Bool)
}

class MSNavigationVM: MSBaseVM {
    func openFirst() {
        self.ownerView?.openView(MSFirstVC(nibName: "MSFirstVC", bundle: nil) , animated: true)
    }
    func closeCurrent() {
        self.ownerView?.selfClose(animated: true)
    }
}
