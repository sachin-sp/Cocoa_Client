//
//  APIEndpoint.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 20/01/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

internal enum APIEndpoint: Hashable {
    
    // MARK: - Cases
    
    case episodes
    case recentEpisodes
    case popularEpisodes
    case episode(Int)
    case categories
    case collections
    
    // MARK: - Properties
    
    var path: String {
        switch self {
        case .episodes:
            return "episodes"
        case .recentEpisodes:
            return "recent-episodes"
        case .popularEpisodes:
            return "popular-episodes"
        case .episode(let id):
            return "episode/\(id)"
        case .categories:
            return "categories"
        case .collections:
            return "collections"
        }
    }
    
}
