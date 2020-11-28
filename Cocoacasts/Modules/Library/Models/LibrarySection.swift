//
//  LibrarySection.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 30/01/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

class LibrarySection {
    
    // MARK: - Types
    
    enum Kind: Int {
        
        // MARK: - Cases
        
        case recentEpisodes
        case popularEpisodes
        case collections
        case categories
        
    }
    
    // MARK: - Properties
    
    let kind: Kind
    
    // MARK: -
    
    var title: String {
        switch kind {
        case .recentEpisodes:
            return "Recent Episodes"
        case .popularEpisodes:
            return "Popular Episodes"
        case .collections:
            return "Collections"
        case .categories:
            return "Categories"
        }
    }

    var numberOfItems: Int {
        fatalError("Subclasses Are Required to Override `numberOfItems`")
    }
    
    // MARK: - Initialization

    init(kind: Kind) {
        // Set Kind
        self.kind = kind
    }
    
}
