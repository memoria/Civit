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
        
        let attributedText = NSMutableAttributedString(string: "The Ocean Cleanup", attributes: [.foregroundColor: UIColor.black])
        
        attributedText.append(NSAttributedString(string: " The Ocean Cleanup is a non-government engineering environmental organization based in the Netherlands, that develops technology to extract plastic pollution from the oceans. After a couple of years of various tests they deployed their first full scale prototype", attributes: [.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "\n\n\nOur Goal", attributes: [.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "\nEvery year, millions of tons of plastic enter the oceans primarily from rivers. The plastic afloat across the oceans – legacy plastic – isn’t going away by itself. Therefore, solving ocean plastic pollution requires a combination of stemming the inflow and cleaning up what has already accumulated.", attributes: [.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "\n\n\nThe Road Towards Relief", attributes: [.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "\nThe Ocean Cleanup is designing and developing cleanup systems to clean up what is already polluting our oceans and to intercept plastic on its way to the ocean via rivers.", attributes: [.foregroundColor: UIColor.gray]))
        
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
