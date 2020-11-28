//
//  CrashlyticsLogger.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 25/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import Crashlytics
import CocoaLumberjack

final class CrashlyticsLogger: DDAbstractLogger {
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        
        // Set Log Formatter
        logFormatter = LogFormatter()
    }
    
    // MARK: - Overrides
    
    override func log(message logMessage: DDLogMessage) {
        guard let formattedLogMessage = logFormatter?.format(message: logMessage) else {
            return
        }
        
        CLSLogv(formattedLogMessage, getVaList([]))
    }
    
}
