//
//  Collection.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 02/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

struct Collection: Decodable {

    // MARK: - Properties
    
    let id: Int
    let name: String
    let thumbnailUrl: URL

    let duration: TimeInterval

}
