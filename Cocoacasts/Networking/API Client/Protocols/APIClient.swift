//
//  APIClient.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 20/01/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

internal protocol APIClient: AnyObject {

    // MARK: - Episodes
    
    func fetchEpisodes(_ completion: @escaping (Result<[Episode], APIError>) -> Void)
    func fetchRecentEpisodes(_ completion: @escaping (Result<[Episode], APIError>) -> Void)
    func fetchPopularEpisodes(_ completion: @escaping (Result<[Episode], APIError>) -> Void)
    
    // MARK: - Episode
    
    func fetchEpisode(with id: Int, _ completion: @escaping (Result<Episode, APIError>) -> Void)
    
    // MARK: - Categories
    
    func fetchCategories(_ completion: @escaping (Result<[Category], APIError>) -> Void)
    
    // MARK: - Collections
    
    func fetchCollections(_ completion: @escaping (Result<[Collection], APIError>) -> Void)

}
