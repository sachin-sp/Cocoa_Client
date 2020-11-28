//
//  FeedCoordinator.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 26/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class FeedCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var rootViewController: UIViewController {
        return feedViewController
    }
    
    // MARK: -
    
    private lazy var feedViewController: FeedViewController = {
        // Initialize API Client
        let apiClient = Environment.apiClient

        // Initialize Feed View Model
        let viewModel = FeedViewModel(apiClient: apiClient)

        // Initialize Feed View Controller
        let feedViewController = FeedViewController.instantiate()

        // Configure Feed View Controller
        feedViewController.viewModel = viewModel

        return feedViewController
    }()
    
}
