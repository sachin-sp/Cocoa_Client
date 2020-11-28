//
//  AppDelegate.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 15/03/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    var window: UIWindow?

    // MARK: -
    
    private let appCoordinator = AppCoordinator()
    
    // MARK: - Application Life Cycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Setup Logging
        Logger.setup()
        
        // Setup Fabric
        Fabric.with([Crashlytics.self])
        
        // Initialize Window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Configure Window
        window?.rootViewController = appCoordinator.rootViewController
        
        // Make Key and Visible
        window?.makeKeyAndVisible()
        
        // Start Coordinator
        appCoordinator.start()
        
        return true
    }

}
