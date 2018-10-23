//
//  MSPlanVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/20/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSPlanVC: MSBaseVC {

    @IBOutlet weak var topBar: MSTopBarView!
    @IBOutlet weak var topBarHeight: NSLayoutConstraint!

    @IBOutlet var planCollectionView: UICollectionView!
    
    let interSpace: CGFloat = 10
    let lineSpace: CGFloat = 3
    var itemSize: CGSize = CGSize.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTopBar(topBar,topBarHeight)

        // Do any additional setup after loading the view.
        self.itemSize = CGSize(width: UIScreenConstant.WIDTH-interSpace*2, height: 45.0)
        self.planCollectionView.registerCellNib(MSPlanCollectionViewCell.className)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MSPlanVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSPlanCollectionViewCell.className, for: indexPath) as! MSPlanCollectionViewCell
        cell.layer.cornerRadius = 5.0
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
    }
}

extension MSPlanVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: interSpace, bottom: 3, right: interSpace)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
}
}
