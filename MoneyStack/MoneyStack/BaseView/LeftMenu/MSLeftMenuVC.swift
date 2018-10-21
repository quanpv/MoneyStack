//
//  MSLeftMenuVC.swift
//  MoneyStack
//
//  Created by Trần Quý on 10/16/18.
//  Copyright © 2018 MoneyStack. All rights reserved.
//

import UIKit

class MSLeftMenuVC: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var buttonPen: MSFullSizeIconButton!
    @IBOutlet weak var avatar: UIImageView!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleChangeTheme(notification:)), name: NotificationChangeTheme, object: nil)
        view.backgroundColor = MSDelegate.config.mainColor
        headerView.backgroundColor = MSDelegate.config.mainColor
        tableView.tableHeaderView = headerView
        headerView.layer.cornerRadius = headerView.height / 2
        tableView.registerCellNib(MSLeftMenuCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = MSDelegate.config.mainColor
        tableView.tableFooterView = UIView()
        
        buttonPen.layer.cornerRadius = buttonPen.height / 2
        buttonPen.layer.borderColor = UIColor.white.cgColor
        buttonPen.layer.borderWidth = 2.0
        
        avatar.layer.cornerRadius = avatar.height / 2
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 2.0
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleChangeTheme(notification: Notification) {
        view.backgroundColor = MSDelegate.config.mainColor
        tableView.separatorColor = MSDelegate.config.mainColor
        headerView.backgroundColor = MSDelegate.config.mainColor
    }
}

extension MSLeftMenuVC: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MSDelegate.leftMenuItemAndRootView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MSLeftMenuCell.className, for: indexPath) as! MSLeftMenuCell
        cell.labelName.text = MSDelegate.leftMenuItemAndRootView[indexPath.row].keys.first
        cell.trailingSpace.constant = indexPath.row == selectedIndex ? 0 : 20
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let type: LeftMenuItem = LeftMenuItem(rawValue: indexPath.row)!
        switch type {
        case .Logout:
            break
        default:
            tableView.reloadData()
        }
        MSDelegate.onLeftMenuClicked(index: indexPath.row)
    }
}
