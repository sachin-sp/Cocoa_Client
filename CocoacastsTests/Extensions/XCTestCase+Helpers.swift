//
//  XCTestCase+Helpers.swift
//  CocoacastsTests
//
//  Created by Bart Jacobs on 30/01/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import XCTest

extension XCTestCase {

    func urlForMockData(with name: String, success: Bool) -> URL {
        // Create File Name
        let fileName = "\(name)_\(success ? "success" : "failure")"

        // Fetch URL for Mock Data
        return Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json")!
    }

}
