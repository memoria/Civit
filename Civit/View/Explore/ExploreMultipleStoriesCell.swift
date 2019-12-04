//
//  ExploreMultipleStoriesCell.swift
//  Civit
//
//  Created by Nishant Patel on 12/3/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class ExploreMultipleStoriesCell: UICollectionViewCell {
    let categoryLabel = UILabel(text: "ENVIRONMENTALIST", font: .boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "Boyan Slat", font: .boldSystemFont(ofSize: 28))
    
    let multipleStoriesController = UIViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        multipleStoriesController.view.backgroundColor = .red
        
        let stackView = VerticalStackView(arrangedSubViews: [categoryLabel, titleLabel, multipleStoriesController.view], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
