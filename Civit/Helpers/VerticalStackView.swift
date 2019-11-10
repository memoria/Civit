//
//  VerticalStackView.swift
//  appstore
//
//  Created by Nishant Patel on 9/24/19.
//  Copyright © 2019 nish. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    init(arrangedSubViews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.axis = .vertical
        
        arrangedSubViews.forEach({addArrangedSubview($0)})
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
