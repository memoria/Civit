//
//  ExploreMultipleStoriesController.swift
//  Civit
//
//  Created by Nishant Patel on 12/7/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class ExploreMultipleStoriesController: BaseListController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    var results = [FeedResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.register(MultipleStoriesCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MultipleStoriesCell
        cell.app = self.results[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 32, height: 72)
    }
    
    fileprivate let spacing: CGFloat = 20
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyUrl = self.results[indexPath.item].articleLink
        
        guard let url = URL(string: storyUrl) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
