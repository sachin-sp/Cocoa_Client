//
//  UICollectionViewCell+Helpers.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 07/11/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    static var nibName: String {
        return String(describing: self)
    }

}
