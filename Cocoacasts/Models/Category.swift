//
//  Category.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 03/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

struct Category: Decodable {

    // MARK: - Properties
    
    let id: Int
    let name: String
    let thumbnailUrl: URL

    let numberOfEpisodes: Int

}
