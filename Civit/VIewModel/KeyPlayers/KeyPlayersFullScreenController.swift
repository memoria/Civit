//
//  KeyPlayersFullScreenController.swift
//  Civit
//
//  Created by Nishant Patel on 11/17/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class KeyPlayersFullScreenController: UITableViewController {
    var dismissHandler: (() -> ())?
    var playerItem: KeyPlayersItem?
    var bottomSafeAreaHeight = UIApplication.shared.statusBarFrame.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = .init(top: 0, left: 0, bottom: bottomSafeAreaHeight, right: 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let headerCell = KeyPlayerFullScreenHeaderCell()
            headerCell.closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
            headerCell.keyPlayersCell.playerItem = playerItem
            headerCell.keyPlayersCell.layer.cornerRadius = 0
            return headerCell
        }
        
        let cell = KeyPlayersFullScreenDescriptionCell()
        
        return cell
    }
    
    @objc func handleDismiss(button: UIButton) {
        button.isHidden = true
        dismissHandler?()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 500
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
