//
//  UICollectionView+Helpers.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 07/11/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Collection View Cell")
        }
        
        return cell
    }
    
}
