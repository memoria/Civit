//
//  HomePageHeader.swift
//  Civit
//
//  Created by Nishant Patel on 11/11/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class HomePageHeader: UICollectionReusableView {
    let homeHeaderHorizontalController = HomeHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(homeHeaderHorizontalController.view)
        homeHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
