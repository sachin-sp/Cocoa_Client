//
//  Logger.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 18/04/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import CocoaLumberjack
import PaperTrailLumberjack

final class Logger {
    
    // Define Log Level
    #if DEBUG
    static let defaultLogLevel: DDLogLevel = .all
    #else
    static let defaultLogLevel: DDLogLevel = .error
    #endif
    
    // MARK: - Class Methods
    
    class func setup() {
        // Configure TTY Logger
        DDTTYLogger.sharedInstance.logFormatter = LogFormatter()

        // Add TTY Logger
        DDLog.add(DDTTYLogger.sharedInstance, with: defaultLogLevel)
        
        // PaperTrail
        if let paperTrailLogger = RMPaperTrailLogger.sharedInstance() {
            // Configure PaperTrail Logger
            paperTrailLogger.port = 44904
            paperTrailLogger.host = "logs3.papertrailapp.com"
            
            // Add PaperTrail Logger
            DDLog.add(paperTrailLogger, with: defaultLogLevel)
        }
        
        // Initialize Crasylytics Logger
        let crashlyticsLogger = CrashlyticsLogger()
        
        // Add Crashlytics Logger
        DDLog.add(crashlyticsLogger, with: defaultLogLevel)
    }
    
}
