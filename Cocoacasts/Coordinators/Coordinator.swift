//
//  Coordinator.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 26/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class Coordinator: NSObject, UINavigationControllerDelegate {
    
    // MARK: - Properties
    
    var didFinish: ((Coordinator) -> Void)?
    
    // MARK: -
    
    var childCoordinators: [Coordinator] = []
    
    // MARK: - Methods
    
    func start() {}
    
    // MARK: -
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {}
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {}
    
    // MARK: -
    
    func pushCoordinator(_ coordinator: Coordinator) {
        // Install Handler
        coordinator.didFinish = { [weak self] (coordinator) in
            self?.popCoordinator(coordinator)
        }
        
        // Start Coordinator
        coordinator.start()
        
        // Append to Child Coordinators
        childCoordinators.append(coordinator)
    }
    
    func popCoordinator(_ coordinator: Coordinator) {
        // Remove Coordinator From Child Coordinators
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
}
