//
//  CollectionViewCell+Extensions.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//

import UIKit

extension UICollectionViewCell {
    
    /**
     Returns class name as identifier.
     - returns: Identifier which can be used instead of `reuseIdentifier`.
     */
    static func identifier() -> String {
        String(describing: self)
    }
    
        /**
     Registers cell automatically to given tableview.
     - parameter collectionView: `UICollectionView`
     */
    static func registerWithNib(to collectionView: UICollectionView?) {
        collectionView?.register(UINib(nibName: identifier(), bundle: nil), forCellWithReuseIdentifier: identifier())
    }
}

