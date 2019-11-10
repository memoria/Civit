//
//  HomeHorizontalController.swift
//  Civit
//
//  Created by Nishant Patel on 11/10/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class HomeHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .blue
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.scrollDirection = .horizontal
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding  - 2 * lineSpacing) / 3
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
}
