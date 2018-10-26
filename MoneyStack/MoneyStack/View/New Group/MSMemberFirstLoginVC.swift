//
//  MSMemberFirstLoginVC.swift
//  MoneyStack
//
//  Created by Pham Van Quan on 10/24/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSMemberFirstLoginVC: MSBaseVC {

    
    @IBOutlet var memberCV: UICollectionView!
    let interSpace: CGFloat = 10
    let lineSpace: CGFloat = 10
    var itemSize: CGSize = CGSize.zero
    
    var listMember: [MemberModel] = [MemberModel("-------", "Ngày sinh", "Giới tính")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.itemSize = CGSize(width: UIScreenConstant.WIDTH-interSpace*2, height: 45.0*3+13)
        self.memberCV.registerCellNib(MSMemberFirstLoginCC.className)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func actionIgnore(_ sender: UIButton) {
        self.selfClose()
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
         self.selfClose()
    }
    func showAddMemberDialog() {
                let customDialog = MSAddMemberDialog(nibName: MSAddMemberDialog.className, bundle: nil)
                customDialog.providesPresentationContextTransitionStyle = true
                customDialog.definesPresentationContext = true
                customDialog.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                customDialog.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                customDialog.delegate = self
        
                self.present(customDialog, animated: true, completion: {
                })
    }
    
}

extension MSMemberFirstLoginVC: MSActionMemberDelegate {
    func deleteBtnPressed(index: Int) {
        print("Position: \(index)")
        listMember.remove(at: index)
        memberCV.reloadData()
    }
    
    func addBtnPressed() {
        showAddMemberDialog()
    }
}

extension MSMemberFirstLoginVC: SubmitDataMemberDelegate {
    func submitMember(_ data: MemberModel) {
        print("\(data.name ?? "-")  \(data.birthDay ?? "-") \(data.gender ?? "-")")
        listMember.append(data)
        memberCV.reloadData()
    }
}

extension MSMemberFirstLoginVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMember.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSMemberFirstLoginCC.className, for: indexPath) as! MSMemberFirstLoginCC
        if(listMember.count==1 || (indexPath.row == listMember.count-1)) {
            cell.btnAddMember.isHidden = false
        } else {
            cell.btnAddMember.isHidden = true
          
        }
        cell.delegate = self
        cell.btnDeleteMember.tag = indexPath.row
        let data = listMember[indexPath.row]
        cell.setData(data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
    }
}

extension MSMemberFirstLoginVC: UICollectionViewDelegateFlowLayout {
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
        if(listMember.count==1 || (indexPath.row == listMember.count-1)) {
          return  CGSize(width: UIScreenConstant.WIDTH-interSpace*2, height: 45.0*3+13)
        } else {
          return  CGSize(width: UIScreenConstant.WIDTH-interSpace*2, height: 45.0*2+3)
        }
       
    }
}
