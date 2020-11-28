//
//  Environment.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 29/03/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import Foundation

enum Environment: String {
    
    // MARK: - Environments
    
    case staging
    case production
    case development

    // MARK: - Current Environment
    
    static let current: Environment = {
        // Read Value From Info.plist
        guard let value = Bundle.main.infoDictionary?["CONFIGURATION"] as? String else {
            fatalError("No Configuration Found")
        }
        
        // Extract Environment
        guard let rawValue = value.split(separator: "/").last else {
            fatalError("Invalid Environment")
        }
        
        // Create Environment
        guard let environment = Environment(rawValue: rawValue.lowercased()) else {
            fatalError("Invalid Environment")
        }
        
        return environment
    }()

    // MARK: - Base URL
    
    private static var baseUrl: URL {
        switch current {
        case .staging:
            return URL(string: "https://staging.cocoacasts.com/api/")!
        case .production:
            return URL(string: "https://cocoacasts.com/api/")!
        case .development:
            return URL(string: "http://0.0.0.0:3000/api/")!
        }
    }
    
    // MARK: - API Key
    
    private static var apiKey: String {
        switch current {
        case .staging:
            return "1bb7a1a05b30ac1ae897258f15b0a1c63fa62ea7"
        case .production:
            return "08b3b2b574dfe3571205678453ae33599e79bf6a"
        case .development:
            return "9e8d3f9fd2ce713bb1ca8e60021e09d0dc6fb654"
        }
    }
    
    // MARK: - API Client

    static var apiClient: APIClient {
        switch current {
        case .development:
            // Create Mock Client
            let mockClient = MockClient()

            // Configure Endpoints
            mockClient.add(response: .success(MockAPI.Episodes.success), for: .episodes)
            mockClient.add(response: .success(MockAPI.Episodes.Recent.success), for: .recentEpisodes)
            mockClient.add(response: .success(MockAPI.Episodes.Popular.success), for: .popularEpisodes)
            mockClient.add(response: .success(MockAPI.Categories.success), for: .categories)
            mockClient.add(response: .success(MockAPI.Collections.success), for: .collections)

            return mockClient
        default:
            return CocoacastsClient(apiKey: apiKey, baseUrl: baseUrl)
        }
    }

    // MARK: - Cloudinary Base URL

    static var cloudinaryBaseUrl: URL {
        return URL(string: "https://res.cloudinary.com/cocoacasts/image/fetch/")!
    }
    
}

private enum MockAPI {
    
    enum Episodes {
        
        static let success = URL(string: "https://cocoacasts.s3.us-west-1.amazonaws.com/mock-api/episodes.json")!
        
        enum Recent {

            static let success = URL(string: "https://cocoacasts.s3.us-west-1.amazonaws.com/mock-api/recent-episodes.json")!

        }
        
        enum Popular {
            
            static let success = URL(string: "https://cocoacasts.s3.us-west-1.amazonaws.com/mock-api/popular-episodes.json")!

        }

    }
    
    enum Categories {
        
        static let success = URL(string: "https://cocoacasts.s3.us-west-1.amazonaws.com/mock-api/categories.json")!

    }
    
    enum Collections {
        
        static let success = URL(string: "https://cocoacasts.s3.us-west-1.amazonaws.com/mock-api/collections.json")!

    }

}
