//
//  PhotosViewModel.swift
//  Navigation
//
//  Created by Suharik on 17.07.2022.
//

import Foundation
import UIKit

final class PhotosViewModel {
    
    private var newPhotoArray = [UIImage]()
    
    private let itemsPerRow: CGFloat = 3
    
    private let sectionInserts = UIEdgeInsets(
        top: 8,
        left: 8,
        bottom: 8,
        right: 8
    )
    
    var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = sectionInserts
        layout.scrollDirection = .vertical
        return layout
    }
        
    func cellViewModel(forIndexPath indexPath: IndexPath, array: [UIImage]) -> PhotosCollectionViewCellViewModel? {
        let image = array[indexPath.item]
        return PhotosCollectionViewCellViewModel(image: image)
    }
    
    func collectionViewLayout(collectionView: UICollectionView) -> CGSize {
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
}


