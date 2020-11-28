//
//  AppCoordinator.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 26/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    lazy var rootViewController = RootViewController.instantiate()
    
    // MARK: -
    
    private lazy var tabBarController: UITabBarController = {
        // Initialize Tab Bar Controller
        let tabBarController = UITabBarController()
        
        // Initialize Child Coordinators
        let feedCoordinator = FeedCoordinator()
        let libraryCoordinator = LibraryCoordinator()
        
        // Update View Controllers
        tabBarController.viewControllers = [
            feedCoordinator.rootViewController,
            libraryCoordinator.rootViewController
        ]
        
        // Append to Child Coordinators
        childCoordinators.append(feedCoordinator)
        childCoordinators.append(libraryCoordinator)
        
        return tabBarController
    }()
    
    // MARK: - Overrides
    
    override func start() {
        // Set Child View Controller
        rootViewController.childViewController = tabBarController
        
        // Start Child Coordinators
        childCoordinators.forEach { (childCoordinator) in
            // Start Child Coordinator
            childCoordinator.start()
        }
    }
    
}
