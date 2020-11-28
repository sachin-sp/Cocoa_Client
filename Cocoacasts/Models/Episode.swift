//
//  Episode.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 06/11/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import Foundation

struct Episode: Decodable {

    // MARK: - Properties
    
    let id: Int
    let plus: Bool
    let title: String
    let excerpt: String
    let author: String
    let category: String
    let thumbnailUrl: URL
    let collection: String?
    let publishedAt: Date

    let duration: TimeInterval
    
    let swift: Int
    let xcode: Int
    let platformName: String
    let platformVersion: Int

}
