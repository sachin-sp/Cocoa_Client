//
//  LibraryCoordinator.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 26/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class LibraryCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var rootViewController: UIViewController {
        return libraryViewController
    }
    
    // MARK: -
    
    private let libraryViewController: LibraryViewController = {
        // Initialize API Client
        let apiClient = Environment.apiClient

        // Initialize Library View Model
        let viewModel = LibraryViewModel(apiClient: apiClient)

        // Initialize Library View Controller
        let libraryViewController = LibraryViewController.instantiate()

        // Configure Library View Controller
        libraryViewController.viewModel = viewModel

        return libraryViewController
    }()
    
}
