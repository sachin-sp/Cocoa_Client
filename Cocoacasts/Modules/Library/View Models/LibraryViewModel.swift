//
//  LibraryViewModel.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 30/01/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

final class LibraryViewModel {
    
    // MARK: - Properties

    private let apiClient: APIClient

    // MARK: -
    
    private var sections: [LibrarySection] = [] {
        didSet {
            DispatchQueue.main.async {
                self.librarySectionsDidChange?()
            }
        }
    }
    
    // MARK: -
    
    var librarySectionsDidChange: (() -> Void)?
    
    // MARK: - Initialization

    init(apiClient: APIClient) {
        // Set Properties
        self.apiClient = apiClient
    }

    // MARK: - Public API
    
    func reloadData() {
        // Fetch Recent Episodes
        apiClient.fetchRecentEpisodes { [weak self] (result) in
            switch result {
            case .success(let episodes):
                // Create Section
                let section = LibraryEpisodesSection(kind: .recentEpisodes, episodes: episodes)
                
                // Update Sections
                self?.updateSection(section: section)
            case .failure(let error):
                print(error)
            }
        }
        
        // Fetch Popular Episodes
        apiClient.fetchPopularEpisodes { [weak self] (result) in
            switch result {
            case .success(let episodes):
                // Create Section
                let section = LibraryEpisodesSection(kind: .popularEpisodes, episodes: episodes)
                
                // Update Sections
                self?.updateSection(section: section)
            case .failure(let error):
                print(error)
            }
        }
        
        // Fetch Collections
        apiClient.fetchCollections { [weak self] (result) in
            switch result {
            case .success(let collections):
                // Create Section
                let section = LibraryCollectionsSection(collections: collections)
                
                // Update Sections
                self?.updateSection(section: section)
            case .failure(let error):
                print(error)
            }
        }
        
        // Fetch Categories
        apiClient.fetchCategories { [weak self] (result) in
            switch result {
            case .success(let categories):
                // Create Section
                let section = LibraryCategoriesSection(categories: categories)
                
                // Update Sections
                self?.updateSection(section: section)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: -
    
    var numberOfSections: Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        return sections[section].numberOfItems
    }
    
    func kind(for section: Int) -> LibrarySection.Kind {
        return sections[section].kind
    }
    
    // MARK: -
    
    func presentable(for index: Int, in section: Int) -> EpisodePresentable {
        guard let section = sections[section] as? LibraryEpisodesSection else {
            fatalError("Invalid Section")
        }
        
        return section.presentable(for: index)
    }
    
    func presentable(for index: Int, in section: Int) -> CollectionPresentable {
        guard let section = sections[section] as? LibraryCollectionsSection else {
            fatalError("Invalid Section")
        }
        
        return section.presentable(for: index)
    }
    
    func presentable(for index: Int, in section: Int) -> CategoryPresentable {
        guard let section = sections[section] as? LibraryCategoriesSection else {
            fatalError("Invalid Section")
        }
        
        return section.presentable(for: index)
    }

    // MARK: -
    
    func section(at index: Int) -> LibrarySection {
        return sections[index]
    }

    // MARK: - Helper Methods

    private func updateSection(section: LibrarySection) {
        // Create Buffer
        var buffer = sections.filter({ $0.kind != section.kind })
        
        // Add Section to Buffer
        buffer.append(section)
        
        // Sort Sections
        sections = buffer.sorted(by: { $0.kind.rawValue < $1.kind.rawValue })
    }
    
}
