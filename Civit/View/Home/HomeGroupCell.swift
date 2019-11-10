//
//  HomeGroupCell.swift
//  Civit
//
//  Created by Nishant Patel on 11/10/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class HomeGroupCell: UICollectionViewCell {
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
    
    // Mark: Horizontal Colleciton Controller
    let horizontalController = HomeHorizontalController()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
