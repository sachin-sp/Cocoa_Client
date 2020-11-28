//
//  CollectionCollectionViewCellViewModel.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 02/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

struct CollectionCollectionViewCellViewModel {
    
    // MARK: - Properties
    
    let collection: Collection
    
}

extension CollectionCollectionViewCellViewModel: CollectionPresentable {
    
    // MARK: - Properties
    
    var name: String {
        return collection.name
    }
    
    var formattedDuration: String {
        // Initialize Date Components Formatter
        let dateComponentsFormatter = DateComponentsFormatter()
        
        // Configure Date Components Formatter
        dateComponentsFormatter.unitsStyle = .positional
        dateComponentsFormatter.zeroFormattingBehavior = .pad
        dateComponentsFormatter.allowedUnits = [.minute, .second]
        
        return dateComponentsFormatter.string(from: collection.duration) ?? "00:00"
    }
    
    // MARK: -
    
    var thumbnailUrl: URL {
        return CloudinaryURLBuilder(source: collection.thumbnailUrl)
            .width(200)
            .build()
    }
    
}
