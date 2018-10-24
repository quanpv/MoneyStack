//
//  MSViewBalanceInfoVC.swift
//  MoneyStack
//
//  Created by Squall on 10/23/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSViewBalanceInfoVC: MSBaseVC {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.registerCellNib(MSMonthlyIncomeCell.self)
        tableview.registerCellNib(MSKindOfMoneyCell.self)
        tableview.registerCellNib(MSOutsideCashCell.self)
        tableview.registerCellNib(MSPatrimonyCell.self)
        tableview.delegate = self
        tableview.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MSViewBalanceInfoVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let condition:ViewBalanceUI = ViewBalanceUI(rawValue: indexPath.row)!
        switch condition {
        case .Monthly_Income:
            var cell:MSMonthlyIncomeCell? = tableview.dequeueReusableCell(withIdentifier: MSMonthlyIncomeCell.className, for: indexPath) as? MSMonthlyIncomeCell
            if !(cell != nil) {
                cell = MSMonthlyIncomeCell(style: .default, reuseIdentifier:
                    MSMonthlyIncomeCell.className)
            }
            return cell!
        case .Kind_Of_Money:
            var cell:MSKindOfMoneyCell? = tableview.dequeueReusableCell(withIdentifier: MSKindOfMoneyCell.className, for: indexPath) as? MSKindOfMoneyCell
            if !(cell != nil) {
                cell = MSKindOfMoneyCell(style: .default, reuseIdentifier:
                    MSKindOfMoneyCell.className)
            }
            return cell!
        case .Outside_Cash:
            var cell:MSOutsideCashCell? = tableview.dequeueReusableCell(withIdentifier: MSOutsideCashCell.className, for: indexPath) as? MSOutsideCashCell
            if !(cell != nil) {
                cell = MSOutsideCashCell(style: .default, reuseIdentifier:
                    MSOutsideCashCell.className)
            }
            return cell!
        case .Patrimony:
            var cell:MSPatrimonyCell? = tableview.dequeueReusableCell(withIdentifier: MSPatrimonyCell.className, for: indexPath) as? MSPatrimonyCell
            if !(cell != nil) {
                cell = MSPatrimonyCell(style: .default, reuseIdentifier:
                    MSPatrimonyCell.className)
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let condition:ViewBalanceUI = ViewBalanceUI(rawValue: indexPath.row)!
        switch condition {
        case .Monthly_Income:
            return 105
        case .Kind_Of_Money:
            return 196
        case .Outside_Cash:
            return 102
        case .Patrimony:
            return 139
        }
    }
}
