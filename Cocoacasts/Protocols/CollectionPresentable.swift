//
//  CollectionPresentable.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 02/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

protocol CollectionPresentable {
    
    // MARK: - Properties
    
    var name: String { get }
    
    // MARK: -
    
    var formattedDuration: String { get }

    // MARK: -

    var thumbnailUrl: URL { get }

}
