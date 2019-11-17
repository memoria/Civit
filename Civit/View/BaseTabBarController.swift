//
//  BaseTabBarController.swift
//  Civit
//
//  Created by Nishant Patel on 11/3/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [createNavController(viewController: HomePageController(), title: "Home", imageName: "home"),
                           createNavController(viewController: UIViewController(), title: "Explore", imageName: "search"),
                           createNavController(viewController: UIViewController(), title: "Key Players", imageName: "key-players"),
                           createNavController(viewController: UIViewController(), title: "Action", imageName: "action")]
    }
    
    private func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
}
