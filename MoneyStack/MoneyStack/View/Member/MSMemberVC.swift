//
//  MSMemberVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/19/18.
// Modified by QuanPV
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSMemberVC: MSBaseVC {

    @IBOutlet weak var topBar: MSTopBarView!
    @IBOutlet weak var topBarHeight: NSLayoutConstraint!

    @IBOutlet var memberCV: UICollectionView!
    
    
    let interSpace: CGFloat = 10
    let lineSpace: CGFloat = 10
    var itemSize: CGSize = CGSize.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTopBar(topBar,topBarHeight)

        // Do any additional setup after loading the view.
        self.itemSize = CGSize(width: UIScreenConstant.WIDTH-interSpace*2, height: 45.0*3+6)
        self.memberCV.registerCellNib(CollectionViewCell.className)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MSMemberVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.className, for: indexPath) as! CollectionViewCell
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
    }
}

extension MSMemberVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: interSpace, bottom: interSpace, right: interSpace)
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
