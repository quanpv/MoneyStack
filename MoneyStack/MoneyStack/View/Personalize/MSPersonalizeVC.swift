//
//  MSPersonalizeVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/19/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSPersonalizeVC: MSBaseVC {
    
    /** Important **/
    @IBOutlet weak var topBar: MSTopBarView!
    @IBOutlet weak var topBarHeight: NSLayoutConstraint!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let interSpace: CGFloat = 10
    let lineSpace: CGFloat = 10
    var itemSize: CGSize = CGSize.zero
    let itemPerLine: Int = UIScreenConstant.WIDTH >= 414 ? 3 : 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTopBar(topBar,topBarHeight)
        
        var width = (UIScreenConstant.WIDTH - CGFloat(itemPerLine + 1) * interSpace) / CGFloat(itemPerLine)
        width = CGFloat(floorf(Float(width)))
        var height = (UIScreenConstant.WIDTH - CGFloat(itemPerLine + 1) * interSpace) / CGFloat(itemPerLine)
        height = CGFloat(floorf(Float(width)))
        self.itemSize = CGSize(width: width, height: height)
        self.collectionView.registerCellNib(MSPersonalizeCC.className)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MSPersonalizeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MSDelegate.config.themeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSPersonalizeCC.className, for: indexPath) as! MSPersonalizeCC
        cell.mainColorView.backgroundColor = MSDelegate.config.themeList[indexPath.item].0
        cell.subColorView.backgroundColor = MSDelegate.config.themeList[indexPath.item].1
        cell.imageCheck.isHidden = MSDelegate.config.currentThemeIndex != indexPath.item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
        MSDelegate.config.updateCurrentThemeIndex(indexPath.item)
    }
}

extension MSPersonalizeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: interSpace, left: interSpace, bottom: interSpace, right: interSpace)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
}
