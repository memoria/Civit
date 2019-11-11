//
//  HomeHeaderCell.swift
//  Civit
//
//  Created by Nishant Patel on 11/11/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class HomeHeaderCell: UICollectionViewCell {
    let companyLabel = UILabel(text: "Company", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "News story headline here", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Mark:
        imageView.backgroundColor = .red
        titleLabel.numberOfLines = 2
        companyLabel.textColor = .blue
        let stackView = VerticalStackView(arrangedSubViews: [companyLabel, titleLabel, imageView], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
