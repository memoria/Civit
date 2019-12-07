//
//  MultipleStoriesCell.swift
//  Civit
//
//  Created by Nishant Patel on 12/7/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class MultipleStoriesCell: UICollectionViewCell {
    let nameLabel = UILabel(text: "App name", font: .systemFont(ofSize: 12))
    let companyLabel = UILabel(text: "Company name", font: .boldSystemFont(ofSize: 12))
    
    let imageView = UIImageView(cornerRadius: 8)
    let getButton = UIButton(title: "View")
    
    let rowLineBreak: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    var app: FeedResult! {
        didSet {
            nameLabel.text = app.name
            companyLabel.text = app.artistName
            imageView.sd_setImage(with: URL(string: app.artworkUrl100))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Mark: Customize UI elements
        imageView.backgroundColor = .red
        imageView.widthAnchor.constraint(equalToConstant: 84).isActive = true
        imageView.constrainHeight(constant: 84)
        nameLabel.numberOfLines = 2
        
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
        
        addSubview(rowLineBreak)
        rowLineBreak.anchor(top: nil, leading: nameLabel.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: 0, height: 0.5))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
