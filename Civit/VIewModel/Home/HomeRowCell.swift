//
//  HomeRowCell.swift
//  Civit
//
//  Created by Nishant Patel on 11/10/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class HomeRowCell: UICollectionViewCell {
    let nameLabel = UILabel(text: "App name", font: .systemFont(ofSize: 16))
    let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 16))
    
    let imageView = UIImageView(cornerRadius: 8)
    let getButton = UIButton(title: "View")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Mark: Customize UI elements
        imageView.backgroundColor = .red
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.constrainHeight(constant: 64)
        
        getButton.backgroundColor = .mainOrange
        getButton.setTitleColor(.white, for: .normal)
        getButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 16
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        // Mark: Add views to cell
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangedSubViews: [nameLabel, companyLabel], spacing: 4), getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
