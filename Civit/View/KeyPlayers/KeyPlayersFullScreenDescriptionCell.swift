//
//  KeyPlayersFullScreenDescriptionCell.swift
//  Civit
//
//  Created by Nishant Patel on 11/17/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class KeyPlayersFullScreenDescriptionCell: UITableViewCell {
    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Lorem Ipsum", attributes: [.foregroundColor: UIColor.black])
        
        attributedText.append(NSAttributedString(string: " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sociis natoque penatibus et magnis. A erat nam at lectus urna.", attributes: [.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "\n\n\nBravo Here", attributes: [.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sociis natoque penatibus et magnis. A erat nam at lectus urna.", attributes: [.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "\n\n\nIlspi Lori", attributes: [.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sociis natoque penatibus et magnis. A erat nam at lectus urna.", attributes: [.foregroundColor: UIColor.gray]))
        
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.attributedText = attributedText
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 0, left: 24, bottom: 0, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
