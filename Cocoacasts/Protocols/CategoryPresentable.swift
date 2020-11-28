//
//  CategoryPresentable.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 03/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

protocol CategoryPresentable {
    
    // MARK: - Properties

    var name: String  { get }
    
    // MARK: -
    
    var numberOfEpisodes: String { get }

    // MARK: -

    var thumbnailUrl: URL { get }

}
