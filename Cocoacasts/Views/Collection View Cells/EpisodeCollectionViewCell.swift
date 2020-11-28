//
//  EpisodeCollectionViewCell.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 07/11/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit
import Kingfisher

class EpisodeCollectionViewCell: UICollectionViewCell {

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
    
    // MARK: -
    
    @IBOutlet private var authorLabel: UILabel!
    @IBOutlet private var categoryLabel: UILabel!
    @IBOutlet private var publishedAtLabel: UILabel!

    // MARK: -
    
    @IBOutlet private var separatorLabels: [UILabel]! {
        didSet {
            separatorLabels.forEach { (label) in
                label.attributedText = "|".toMetadata(color: .lightGray)
            }
        }
    }
    
    // MARK: - Public API
    
    func configure(with presentable: EpisodePresentable) {
        // Configure Duration Label
        durationLabel.attributedText = presentable.formattedDuration.toDetail(color: .white)
        
        // Configure Image View
        imageView.kf.setImage(with: presentable.thumbnailUrl)

        // Configure Title Label
        titleLabel.attributedText = presentable.title.toTitle(color: UIColor.Cocoacasts.red)
        
        // Configure Collection Label
        subtitleLabel.isHidden = presentable.collection == nil
        subtitleLabel.attributedText = presentable.collection?.toSubtitle(color: .lightGray)
        
        // Configure Metadata Labels
        authorLabel.attributedText = presentable.author.toMetadata(color: .lightGray)
        categoryLabel.attributedText = presentable.category.toMetadata(color: .lightGray)
        publishedAtLabel.attributedText = presentable.publishedAt.toMetadata(color: .red)
    }
    
}
