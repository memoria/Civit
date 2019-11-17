//
//  ArticleDetailsController.swift
//  Civit
//
//  Created by Nishant Patel on 11/16/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class ArticleDetailsController: BaseListController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://stackoverflow.com") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
