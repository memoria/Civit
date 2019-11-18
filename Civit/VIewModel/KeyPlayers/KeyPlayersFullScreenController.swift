//
//  KeyPlayersFullScreenController.swift
//  Civit
//
//  Created by Nishant Patel on 11/17/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class KeyPlayersFullScreenController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            return KeyPlayerFullScreenHeaderCell()
        }
        
        let cell = KeyPlayersFullScreenDescriptionCell()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 450
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
