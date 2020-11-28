//
//  MockClient.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 20/01/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

/**
 The `MockClient` class can be used to locally
 test the Cocoacasts application without
 the need for a local server.
 */

import Foundation

final class MockClient: APIClient {

    // MARK: - Types

   enum Response {

        // MARK: - Cases

        case success(URL)
        case failure(APIError)

    }

    // MARK: - Properties

    private var endpoints: [APIEndpoint: Response] = [:]
    
    // MARK: - API Client

    func fetchEpisodes(_ completion: @escaping (Result<[Episode], APIError>) -> Void) {
        guard let response = endpoints[.episodes] else {
            completion(.failure(.requestFailed))
            return
        }
        
        switch response {
        case .success(let url):
            self.response(for: url) { (episodes: [Episode]) in
                completion(.success(episodes))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    func fetchRecentEpisodes(_ completion: @escaping (Result<[Episode], APIError>) -> Void) {
        guard let response = endpoints[.recentEpisodes] else {
            completion(.failure(.requestFailed))
            return
        }
        
        switch response {
        case .success(let url):
            self.response(for: url) { (episodes: [Episode]) in
                completion(.success(episodes))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    func fetchPopularEpisodes(_ completion: @escaping (Result<[Episode], APIError>) -> Void) {
        guard let response = endpoints[.popularEpisodes] else {
            completion(.failure(.requestFailed))
            return
        }
        
        switch response {
        case .success(let url):
            self.response(for: url) { (episodes: [Episode]) in
                completion(.success(episodes))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }

    func fetchEpisode(with id: Int, _ completion: @escaping (Result<Episode, APIError>) -> Void) {
        guard let response = endpoints[.episode(id)] else {
            fatalError("No Response Found for Endpoint")
        }
        
        switch response {
        case .success(let url):
            self.response(for: url) { (episode: Episode) in
                completion(.success(episode))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    func fetchCategories(_ completion: @escaping (Result<[Category], APIError>) -> Void) {
        guard let response = endpoints[.categories] else {
            completion(.failure(.requestFailed))
            return
        }
        
        switch response {
        case .success(let url):
            self.response(for: url) { (categories: [Category]) in
                completion(.success(categories))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }

    func fetchCollections(_ completion: @escaping (Result<[Collection], APIError>) -> Void) {
        guard let response = endpoints[.collections] else {
            completion(.failure(.requestFailed))
            return
        }
        
        switch response {
        case .success(let url):
            self.response(for: url) { (collections: [Collection]) in
                completion(.success(collections))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }

    // MARK: -
    
    func add(response: Response, for endpoint: APIEndpoint) {
        endpoints[endpoint] = response
    }
    
    // MARK: - Helper Methods

    private func response<T: Decodable>(for url: URL, completion: @escaping (T) -> Void) {
        DispatchQueue.global(qos: .utility).async {
            // Load Mock Data
            guard let data = try? Data(contentsOf: url) else {
                fatalError("Unable to Load Mock Data")
            }
            
            // Initialize JSON Decoder
            let decoder = JSONDecoder()

            // Configure JSON Decoder
            decoder.dateDecodingStrategy = .iso8601
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            // Decode JSON Response
            guard let result = try? decoder.decode(T.self, from: data) else {
                fatalError("Unable to Decode Mock Data")
            }
            
            completion(result)
        }
    }
    
}
