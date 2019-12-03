//
//  KeyPlayersCell.swift
//  Civit
//
//  Created by Nishant Patel on 11/17/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class KeyPlayersCell: UICollectionViewCell {
    var playerItem: KeyPlayersItem! {
        didSet {
            categoryLabel.text = playerItem.category
            titleLabel.text = playerItem.title
            imageView.image = playerItem.image
            descriptionLabel.text = playerItem.description
        }
    }
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
    
    let categoryLabel = UILabel(text: "ENVIRONMENTALIST", font: .boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "Boyan Slat", font: .boldSystemFont(ofSize: 28))
    let descriptionLabel = UILabel(text: "The Ocean Cleanup", font: .italicSystemFont(ofSize: 16))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 16
        
        imageView.contentMode = .scaleAspectFill
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
        
        let stackView = VerticalStackView(arrangedSubViews: [categoryLabel, titleLabel, imageContainerView, descriptionLabel], spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
