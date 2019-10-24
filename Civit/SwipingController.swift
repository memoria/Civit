//
//  SwipeController.swift
//  Civit
//
//  Created by 206538870 on 10/23/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .yellow
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

}
