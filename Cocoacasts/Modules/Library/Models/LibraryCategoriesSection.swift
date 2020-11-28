//
//  LibraryCategoriesSection.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 03/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

final class LibraryCategoriesSection: LibrarySection {
    
    // MARK: - Properties
    
    let categories: [Category]

    // MARK: - Initialization

    init(categories: [Category]) {
        // Set Categories
        self.categories = categories
        
        super.init(kind: .categories)
    }
    
    // MARK: - Public API
    
    override var numberOfItems: Int {
        return categories.count
    }
    
    // MARK: -
    
    func presentable(for index: Int) -> CategoryPresentable {
        return CategoryCollectionViewCellViewModel(category: category(at: index))
    }
    
    // MARK: - Helper Methods

    private func category(at index: Int) -> Category {
        return categories[index]
    }
    
}
