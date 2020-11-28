//
//  LibraryEpisodesSection.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 02/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

final class LibraryEpisodesSection: LibrarySection {
    
    // MARK: - Properties
    
    let episodes: [Episode]

    // MARK: - Initialization

    init(kind: Kind, episodes: [Episode]) {
        // Set Episodes
        self.episodes = episodes
        
        super.init(kind: kind)
    }

    // MARK: - Public API
    
    override var numberOfItems: Int {
        return episodes.count
    }

    // MARK: -
    
    func presentable(for index: Int) -> EpisodePresentable {
        return EpisodeCollectionViewCellViewModel(episode: episode(at: index))
    }
    
    // MARK: - Helper Methods

    private func episode(at index: Int) -> Episode {
        return episodes[index]
    }

}
