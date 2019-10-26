//
//  SwipeController.swift
//  Civit
//
//  Created by 206538870 on 10/23/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let pages = [ Page(imageName: "logo", headerText: "Welcome", bodyText: "Stay informed, and become the world's saving grace."),
                  Page(imageName: "logo", headerText: "All For One", bodyText: "Your thoughts, voice and actions will make the difference the future needs."),
                  Page(imageName: "logo", headerText: "Along The Way", bodyText: "Don't forget to stop and smell the roses.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
//        cell.logoImage.image = UIImage(named: page.imageName)
//        cell.descriptionText.text = page.headerText
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
