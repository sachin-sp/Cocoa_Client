//
//  CategoryCollectionViewCell.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 03/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    
    @IBOutlet private var imageView: UIImageView!

    // MARK: -
    
    @IBOutlet private var titleLabel: UILabel! {
        didSet {
            // Configure Title Label
            titleLabel.numberOfLines = 2
        }
    }
    
    @IBOutlet private var subtitleLabel: UILabel! {
        didSet {
            // Configure Subtitle Label
            subtitleLabel.numberOfLines = 2
        }
    }
    
    // MARK: - Public API
    
    func configure(with presentable: CategoryPresentable) {
        // Configure Image View
        imageView.kf.setImage(with: presentable.thumbnailUrl)

        // Configure Labels
        titleLabel.attributedText = presentable.name.toTitle(color: UIColor.Cocoacasts.red)
        subtitleLabel.attributedText = presentable.numberOfEpisodes.toSubtitle(color: .lightGray)
    }

}
