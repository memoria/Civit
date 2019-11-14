//
//  HomeController.swift
//  Civit
//
//  Created by Nishant Patel on 11/10/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class HomePageController: BaseListController, UICollectionViewDelegateFlowLayout {
    let cellId = "id"
    let headerId = "headerId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(HomeGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(HomePageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        // Loading anim
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        
        fetchData()
    }
    
    var socialApps = [SocialApp]()
    var groups = [HomeGroup]()
    
    fileprivate func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        var group1: HomeGroup?
        var group2: HomeGroup?
        var group3: HomeGroup?
      
        dispatchGroup.enter()
        APIService.shared.fetchGames { (homeGroup, err) in
            dispatchGroup.leave()
            if let err = err {
                print ("Failed to fetch games: ", err)
                return
            }

            group1 = homeGroup
        }
        
        dispatchGroup.enter()
        APIService.shared.fetchTopGrossing { (homeGroup, err) in
            dispatchGroup.leave()
            if let err = err {
                print ("Failed to fetch games: ", err)
                return
            }
           group2 = homeGroup
        }
        
        
        dispatchGroup.enter()
        APIService.shared.fetchFreeApps { (homeGroup, err) in
            dispatchGroup.leave()
            
            if let err = err {
                print ("Failed to fetch games: ", err)
                return
            }
            
            group3 = homeGroup
        }
        
        dispatchGroup.enter()
        APIService.shared.fetchSocialApps { (apps, err) in
            dispatchGroup.leave()
            apps?.forEach({ print($0.name) })
            
            self.socialApps = apps ?? []
        }
        
        dispatchGroup.notify(queue: .main) {
            self.activityIndicatorView.stopAnimating()
            print("Completed dispatch task ")
            
            guard let games = group1 else { return }
            guard let topGrossing = group2 else { return }
            guard let freeApps = group3 else { return }
            
            self.groups.append(contentsOf: [games, topGrossing, freeApps])
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HomePageHeader
        header.homeHeaderHorizontalController.socialApps = self.socialApps
        header.homeHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeGroupCell
        let appGroup = groups[indexPath.item]
        
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.homeGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}
