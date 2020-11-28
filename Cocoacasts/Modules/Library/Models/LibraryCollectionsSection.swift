//
//  LibraryCollectionsSection.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 02/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

final class LibraryCollectionsSection: LibrarySection {
    
    // MARK: - Properties
    
    let collections: [Collection]

    // MARK: - Initialization

    init(collections: [Collection]) {
        // Set Collections
        self.collections = collections
        
        super.init(kind: .collections)
    }
    
    // MARK: - Public API
    
    override var numberOfItems: Int {
        return collections.count
    }
    
    // MARK: -
    
    func presentable(for index: Int) -> CollectionPresentable {
        return CollectionCollectionViewCellViewModel(collection: collection(at: index))
    }
    
    // MARK: - Helper Methods

    private func collection(at index: Int) -> Collection {
        return collections[index]
    }
    
}
