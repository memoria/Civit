//
//  KeyPlayersControler.swift
//  Civit
//
//  Created by Nishant Patel on 11/17/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class ExploreController: BaseListController, UICollectionViewDelegateFlowLayout {
//    let cellId = "cellId"
//    fileprivate let multipleStoriesCellId = "multipleStoriesCellId"
    
    let players = [
        KeyPlayersItem.init(category: "THE DAILY LIST", title: "Test ddrive this cell dawf", image: #imageLiteral(resourceName: "garden"), description: "", backgroundColor: .white, cellType: .multiple),
        KeyPlayersItem.init(category: "Life Hack", title: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), description: "What the heck I do now", backgroundColor: .white, cellType: .single),
        KeyPlayersItem.init(category: "Vanille Porxie", title: "New dude your Time", image: #imageLiteral(resourceName: "logo"), description: "BLAAAAA I do now", backgroundColor: #colorLiteral(red: 0.9895765185, green: 0.9692960382, blue: 0.7291715741, alpha: 1), cellType: .single)
    ]
    
    var startingFrame: CGRect?
    var keyPlayersFullScreenController: KeyPlayersFullScreenController!
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = #colorLiteral(red: 0.9537788033, green: 0.9487789273, blue: 0.9574493766, alpha: 1)
        
        collectionView.register(KeyPlayersCell.self, forCellWithReuseIdentifier: KeyPlayersItem.CellType.single.rawValue)
        collectionView.register(ExploreMultipleStoriesCell.self, forCellWithReuseIdentifier: KeyPlayersItem.CellType.multiple.rawValue)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = players[indexPath.item].cellType.rawValue
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType, for: indexPath)
        
        if let cell = cell as? KeyPlayersCell {
            cell.playerItem = players[indexPath.item]
        } else if let cell = cell as? ExploreMultipleStoriesCell {
            cell.multipleStoriesItem = players[indexPath.item]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let KeyPlayersFullScreen = KeyPlayersFullScreenController()
        KeyPlayersFullScreen.playerItem = players[indexPath.row]
        KeyPlayersFullScreen.dismissHandler = {
            self.handleRemoveRedView()
        }
        let fullScreenView = KeyPlayersFullScreen.view!
        
        view.addSubview(fullScreenView)
        fullScreenView.layer.cornerRadius = 16
        addChild(KeyPlayersFullScreen)
        self.keyPlayersFullScreenController = KeyPlayersFullScreen
        
        fullScreenView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        fullScreenView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = fullScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = fullScreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullScreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach{($0?.isActive = true)}
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height
        }, completion: nil)
    }
    
    @objc func handleRemoveRedView() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
            self.keyPlayersFullScreenController.tableView.contentOffset = .zero
            self.keyPlayersFullScreenController.tableView.scrollsToTop = true
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            self.view.layoutIfNeeded()
            
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height
            }
            
        }, completion: { _ in
            self.keyPlayersFullScreenController.view.removeFromSuperview()
            self.keyPlayersFullScreenController.removeFromParent()
        })
    }
    
} // end KeyPlayersController
