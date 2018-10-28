//
//  MSDashboardVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSDashboardVC: MSBaseVC {
    
    @IBOutlet weak var topSpaceOfMainView: NSLayoutConstraint!
    @IBOutlet weak var viewMoneyBag: UIView!
    @IBOutlet weak var viewPlus: UIView!
    @IBOutlet weak var viewCollapse: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adjustableTopSpace = topSpaceOfMainView
        collectionView.registerCellNib(MSDashboardCC.className)
        collectionView.registerCellNib(MSDashboardFirstCC.className)
        updateBottomItemsColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickMoneyBag(_ sender: Any) {
        //MARK: - TODO: Open [View Balance info]
    }
    
    @IBAction func clickPlus(_ sender: Any) {
        //MARK: - TODO: Open [Expense - Add Record]
    }
    
    @IBAction func actionCollapse(_ sender: Any) {
        //MARK: - TODO: actionCollapse
    }
    
    override func handleChangeTheme(notification: Notification) {
        super.handleChangeTheme(notification: notification)
        updateBottomItemsColor()
    }
    
    func updateBottomItemsColor() {
        viewMoneyBag.backgroundColor = MSDelegate.config.mainColor
        viewPlus.backgroundColor = MSDelegate.config.subColor
        viewCollapse.backgroundColor = MSDelegate.config.mainColor
    }
}

extension MSDashboardVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSDashboardFirstCC.className, for: indexPath) as! MSDashboardFirstCC
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSDashboardCC.className, for: indexPath) as! MSDashboardCC
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension MSDashboardVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: MSCollectionViewConst.interSpace, left: MSCollectionViewConst.interSpace, bottom: MSCollectionViewConst.interSpace, right: MSCollectionViewConst.interSpace)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return MSCollectionViewConst.interSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return MSCollectionViewConst.lineSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreenConstant.WIDTH - 2 * MSCollectionViewConst.lineSpace, height: indexPath.item == 0 ? 45 : 92)
    }
}
