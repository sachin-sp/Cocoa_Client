//
//  FeedViewModel.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 06/11/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import Foundation

final class FeedViewModel {

    // MARK: - Properties

    private let apiClient: APIClient

    // MARK: -
    
    private var episodes: [Episode] = [] {
        didSet {
            DispatchQueue.main.async {
                self.episodesDidChange?()
            }
        }
    }
    
    // MARK: -
    
    var episodesDidChange: (() -> Void)?
    
    // MARK: - Initialization

    init(apiClient: APIClient) {
        // Set Properties
        self.apiClient = apiClient

        // Fetch Episodes
        apiClient.fetchEpisodes { [weak self] (result) in
            switch result {
            case .success(let episodes):
                self?.episodes = episodes
            case .failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Public API
    
    var numberOfEpisodes: Int {
        return episodes.count
    }

    func presentable(for index: Int) -> EpisodePresentable {
        return EpisodeCollectionViewCellViewModel(episode: episode(at: index))
    }
    
    // MARK: - Helper Methods

    private func episode(at index: Int) -> Episode {
        return episodes[index]
    }
    
}
