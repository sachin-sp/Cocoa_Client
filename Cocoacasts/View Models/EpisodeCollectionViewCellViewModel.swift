//
//  EpisodeCollectionViewCellViewModel.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 18/11/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

struct EpisodeCollectionViewCellViewModel {
    
    // MARK: - Properties
    
    let episode: Episode

}

extension EpisodeCollectionViewCellViewModel: EpisodePresentable {

    // MARK: - Properties
    
    var title: String {
        return episode.title
    }
    
    var author: String {
        return "by \(episode.author)"
    }
    
    var category: String {
        return episode.category
    }

    // MARK: -
    
    var collection: String? {
        return episode.collection
    }
    
    // MARK: -
    
    var formattedDuration: String {
        // Initialize Date Components Formatter
        let dateComponentsFormatter = DateComponentsFormatter()
        
        // Configure Date Components Formatter
        dateComponentsFormatter.unitsStyle = .positional
        dateComponentsFormatter.zeroFormattingBehavior = .pad
        dateComponentsFormatter.allowedUnits = [.minute, .second]
        
        return dateComponentsFormatter.string(from: episode.duration) ?? "00:00"
    }
    
    // MARK: -
    
    var thumbnailUrl: URL {
        return CloudinaryURLBuilder(source: episode.thumbnailUrl)
            .width(200)
            .build()
    }
    
    var publishedAt: String {
        // Initialize Date Formatter
        let dateFormatter = DateFormatter()

        // Configure Date Formatter
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        return dateFormatter.string(from: episode.publishedAt)
    }

}
