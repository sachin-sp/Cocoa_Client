//
//  APIEndpoint+Helpers.swift
//  CocoacastsTests
//
//  Created by Bart Jacobs on 30/01/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation
@testable import Cocoacasts

extension APIEndpoint {

    var fileName: String {
        return path.replacingOccurrences(of: "/", with: "_")
    }

}
