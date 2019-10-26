//
//  PageCell.swift
//  Civit
//
//  Created by 206538870 on 10/24/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            
            logoImage.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSMutableAttributedString(string: "\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
            
            descriptionText.attributedText = attributedText
        }
    }
    
    private let logoImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.8039215686, blue: 0.4980392157, alpha: 1)
        
        return image
    }()
    
    private let descriptionText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        let attributedText = NSMutableAttributedString(string: "Welcome", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSMutableAttributedString(string: "\n\nStay informed, and become the world's saving grace.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
        
        textView.attributedText = attributedText
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    func setupLayout() {
        let topImageContainer = UIView()
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topImageContainer)
        
        topImageContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        topImageContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainer.addSubview(logoImage)
        
        logoImage.leadingAnchor.constraint(equalTo: topImageContainer.leadingAnchor, constant: 40).isActive = true
        logoImage.bottomAnchor.constraint(equalTo: topImageContainer.bottomAnchor).isActive = true
        
        addSubview(descriptionText)
        descriptionText.topAnchor.constraint(equalTo: logoImage.bottomAnchor).isActive = true
        descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
