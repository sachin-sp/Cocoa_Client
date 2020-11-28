//
//  EpisodePresentable.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 14/11/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import Foundation

protocol EpisodePresentable {
    
    // MARK: - Properties

    var title: String  { get }
    var author: String { get }
    var category: String { get }
    
    // MARK: -
    
    var collection: String? { get }

    // MARK: -
    
    var formattedDuration: String { get }

    // MARK: -

    var thumbnailUrl: URL { get }
    
    // MARK: -
    
    var publishedAt: String { get }

}
