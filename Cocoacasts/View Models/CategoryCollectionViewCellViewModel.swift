//
//  CategoryCollectionViewCellViewModel.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 03/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

struct CategoryCollectionViewCellViewModel {
    
    // MARK: - Properties
    
    let category: Category
    
}

extension CategoryCollectionViewCellViewModel: CategoryPresentable {
    
    // MARK: - Properties
    
    var name: String {
        return category.name
    }
    
    var numberOfEpisodes: String {
        if category.numberOfEpisodes == 1 {
            return "\(category.numberOfEpisodes) Episode"
        } else {
            return "\(category.numberOfEpisodes) Episodes"
        }
    }
    
    // MARK: -
    
    var thumbnailUrl: URL {
        return CloudinaryURLBuilder(source: category.thumbnailUrl)
            .width(200)
            .build()
    }
    
}
