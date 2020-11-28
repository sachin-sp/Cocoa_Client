//
//  APIClient.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 06/11/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import Foundation
import CocoaLumberjack

final class CocoacastsClient: APIClient {

    // MARK: - Properties

    private let apiKey: String

    // MARK: -
    
    private let baseUrl: URL

    // MARK: - Initialization

    init(apiKey: String, baseUrl: URL) {
        // Set Properties
        self.apiKey = apiKey
        self.baseUrl = baseUrl
    }

    // MARK: - Public API

    func fetchEpisodes(_ completion: @escaping (Result<[Episode], APIError>) -> Void) {
        // Create and Initiate Data Task
        URLSession.shared.dataTask(with: request(for: .episodes)) { (data, response, error) in
            if let data = data {
                do {
                    // Initialize JSON Decoder
                    let decoder = JSONDecoder()

                    // Configure JSON Decoder
                    decoder.dateDecodingStrategy = .iso8601
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    // Decode JSON Response
                    let episodes = try decoder.decode([Episode].self, from: data)

                    // Invoke Handler
                    completion(.success(episodes))
                } catch {
                    // Invoke Handler
                    completion(.failure(.invalidResponse))
                }

            } else {
                // Invoke Handler
                completion(.failure(.requestFailed))
                
                if let error = error {
                    DDLogError("Unable to Fetch Episodes \(error)")
                } else {
                    DDLogError("Unable to Fetch Episodes")
                }
            }
        }.resume()
    }
    
    func fetchRecentEpisodes(_ completion: @escaping (Result<[Episode], APIError>) -> Void) {
        
    }
    
    func fetchPopularEpisodes(_ completion: @escaping (Result<[Episode], APIError>) -> Void) {
        
    }

    func fetchEpisode(with id: Int, _ completion: @escaping (Result<Episode, APIError>) -> Void) {
        
    }

    func fetchCategories(_ completion: @escaping (Result<[Category], APIError>) -> Void) {
        
    }
    
    func fetchCollections(_ completion: @escaping (Result<[Collection], APIError>) -> Void) {
        
    }

    // MARK: - Helper Methods

    private func request(for endpoint: APIEndpoint) -> URLRequest {
        // Create URL
        let url = baseUrl.appendingPathComponent(endpoint.path)

        // Create Request
        var request = URLRequest(url: url)

        // Configure Request
        request.addValue(apiKey, forHTTPHeaderField: "X-API-Key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }

}
