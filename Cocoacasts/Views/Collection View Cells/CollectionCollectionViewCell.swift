//
//  CollectionCollectionViewCell.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 02/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    @IBOutlet var durationView: UIView! {
        didSet {
            // Configure Duration View
            durationView.backgroundColor = UIColor.Cocoacasts.red
            
            // Configure Layer Duration View
            durationView.layer.cornerRadius = 4.0
            durationView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var durationLabel: UILabel!
    
    // MARK: -
    
    @IBOutlet private var imageView: UIImageView!
    
    // MARK: -
    
    @IBOutlet private var nameLabel: UILabel! {
        didSet {
            // Configure Name Label
            nameLabel.numberOfLines = 2
        }
    }
    
    // MARK: - Public API
    
    func configure(with presentable: CollectionPresentable) {
        // Configure Duration Label
        durationLabel.attributedText = presentable.formattedDuration.toDetail(color: .white)
        
        // Configure Image View
        imageView.kf.setImage(with: presentable.thumbnailUrl)

        // Configure Name Label
        nameLabel.attributedText = presentable.name.toTitle(color: UIColor.Cocoacasts.red)
    }
    
}
