//
//  FeedViewModelTests.swift
//  CocoacastsTests
//
//  Created by Bart Jacobs on 30/01/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import XCTest
@testable import Cocoacasts

class FeedViewModelTests: XCTestCase {

    // MARK: - Properties

    private lazy var apiClient: APIClient = {
        // Initialize Mock Client
        let mockClient = MockClient()

        // Configure Mock Client
        mockClient.add(response: .success(urlForMockData(with: APIEndpoint.episodes.fileName, success: true)), for: .episodes)

        return mockClient
    }()
    
    // MARK: - Set Up & Tear Down

    override func setUp() {}

    override func tearDown() {}

    // MARK: - Tests for Episodes Did Change

    func testEpisodesDidChange() {
        // Create View Model
        let viewModel = FeedViewModel(apiClient: apiClient)

        // Create Expectation
        let expectation = self.expectation(description: "Episodes Did Change")

        // Install Handler
        viewModel.episodesDidChange = {
            // Fulfill Expectation
            expectation.fulfill()
        }

        // Wait for Expectations
        let result = XCTWaiter.wait(for: [ expectation ], timeout: 1.0)

        if result != .completed {
            XCTFail("Test Did Time Out")
        }
    }

    // MARK: - Tests for Number of Episodes

    func testNumberOfEpisodes() {
        // Create View Model
        let viewModel = FeedViewModel(apiClient: apiClient)

        // Create Expectation
        let expectation = self.expectation(description: "Episodes Did Change")

        // Install Handler
        viewModel.episodesDidChange = {
            // Fulfill Expectation
            expectation.fulfill()
        }

        // Assertions
        XCTAssertEqual(viewModel.numberOfEpisodes, 0)

        // Wait for Expectations
        let result = XCTWaiter.wait(for: [ expectation ], timeout: 1.0)

        switch result {
        case .completed:
            // Assertions
            XCTAssertEqual(viewModel.numberOfEpisodes, 20)
        default:
            XCTFail("Test Did Time Out")
        }
    }
    
    // MARK: - Tests for Presentable for Index

    func testPresentableForIndex() {
        // Create View Model
        let viewModel = FeedViewModel(apiClient: apiClient)

        // Create Expectation
        let expectation = self.expectation(description: "Episodes Did Change")

        // Install Handler
        viewModel.episodesDidChange = {
            // Fulfill Expectation
            expectation.fulfill()
        }

        // Wait for Expectations
        let result = XCTWaiter.wait(for: [ expectation ], timeout: 1.0)

        switch result {
        case .completed:
            // Fetch Presentable
            let presentable = viewModel.presentable(for: 1)

            // Assertions
            XCTAssertEqual(presentable.title, "Debugging User Interface Issues")
            XCTAssertEqual(presentable.author, "by Jim Johnson")
            XCTAssertEqual(presentable.category, "Xcode")
            XCTAssertEqual(presentable.collection, "Debugging Applications With Xcode")
            XCTAssertEqual(presentable.formattedDuration, "07:06")
            XCTAssertEqual(presentable.publishedAt, "Apr 10, 2018")
        default:
            XCTFail("Test Did Time Out")
        }
    }
    
}
