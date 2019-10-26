//
//  PageCell.swift
//  Civit
//
//  Created by 206538870 on 10/24/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    let logoImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Frame"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.8039215686, blue: 0.4980392157, alpha: 1)
        
        return image
    }()
    
    // This needs to be adjusted
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.systemGray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
         return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    func setupLayout() {
        let topImageContainer = UIView()
//        topImageContainer.backgroundColor = .yellow
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topImageContainer)
        
        topImageContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainer.addSubview(logoImage)
        
        logoImage.leadingAnchor.constraint(equalTo: topImageContainer.leadingAnchor, constant: 40).isActive = true
        logoImage.bottomAnchor.constraint(equalTo: topImageContainer.bottomAnchor).isActive = true
//        logoImage.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
