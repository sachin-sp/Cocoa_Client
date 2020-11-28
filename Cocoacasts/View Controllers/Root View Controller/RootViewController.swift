//
//  RootViewController.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 11/04/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, Storyboardable {
    
    // MARK: - Storyboardable
    
    static var storyboardName: String {
        return "Root"
    }
    
    // MARK: - Properties
    
    var childViewController: UIViewController? {
        didSet {
            // Replace Child View Controller
            replace(viewController: oldValue, with: childViewController)
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Helper Methods
    
    private func replace(viewController from: UIViewController?, with to: UIViewController?) {
        if let viewController = from {
            // Remove Child View From Superview
            viewController.view.removeFromSuperview()
            
            // Notify Child View Controller
            viewController.didMove(toParent: nil)
        }
        
        if let viewController = to {
            // Add Child View Controller
            addChild(viewController)
            
            // Add Child View as Subview
            view.addSubview(viewController.view)
            
            // Configure Child View
            viewController.view.translatesAutoresizingMaskIntoConstraints = false
            
            // Define Constraints for Child View
            viewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            viewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            viewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            // Notify Child View Controller
            viewController.didMove(toParent: self)
        }
    }
    
}
