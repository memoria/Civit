//
//  KeyPlayersItem.swift
//  Civit
//
//  Created by Nishant Patel on 12/2/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

struct KeyPlayersItem {
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    let cellType: CellType
    
    enum CellType: String {
        case single, multiple
    }
}
