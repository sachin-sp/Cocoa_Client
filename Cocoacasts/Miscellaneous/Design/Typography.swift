//
//  Typography.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 21/11/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

extension String {
    
    func toTitle(color: UIColor = .black, textAlignment: NSTextAlignment = .center) -> NSAttributedString {
        return StringBuilder(string: self)
            .size(24.0)
            .color(color)
            .fontName(.breeSerif)
            .textAlignment(textAlignment)
            .build()
    }
    
    func toSubtitle(color: UIColor = .black, textAlignment: NSTextAlignment = .center) -> NSAttributedString {
        return StringBuilder(string: self)
            .size(17.0)
            .color(color)
            .fontName(.latoRegular)
            .textAlignment(textAlignment)
            .build()
    }
    
    func toDetail(color: UIColor = .black, textAlignment: NSTextAlignment = .center) -> NSAttributedString {
        return StringBuilder(string: self)
            .size(14.0)
            .color(color)
            .fontName(.latoRegular)
            .textAlignment(textAlignment)
            .build()
    }
    
    func toMetadata(color: UIColor = .black, textAlignment: NSTextAlignment = .left) -> NSAttributedString {
        return StringBuilder(string: self)
            .size(12.0)
            .color(color)
            .fontName(.latoRegular)
            .textAlignment(textAlignment)
            .build()
    }

}

final class StringBuilder {
    
    // MARK: - Types
    
    enum FontName: String {
        
        // MARK: - Cases
        
        case breeSerif = "BreeSerif-Regular"
        case latoBold = "Lato-Bold"
        case latoLight = "Lato-Light"
        case latoRegular = "Lato-Regular"

        // MARK: - Methods
        
        fileprivate func font(of size: CGFloat) -> UIFont {
            return UIFont(name: rawValue, size: size)!
        }

    }

    // MARK: - Properties
    
    private let string: String
    
    // MARK: -
    
    private var fontName: FontName = .latoRegular

    // MARK: -
    
    private var size: CGFloat = 17.0

    // MARK: -
    
    private var color: UIColor = .black

    // MARK: -
    
    private var textAlignment: NSTextAlignment = .center
    
    // MARK: - Initialization

    init(string: String) {
        // Set Properties
        self.string = string
    }

    // MARK: - Public API

    func fontName(_ fontName: FontName) -> StringBuilder {
        self.fontName = fontName
        return self
    }

    func size(_ size: CGFloat) -> StringBuilder {
        self.size = size
        return self
    }

    func color(_ color: UIColor) -> StringBuilder {
        self.color = color
        return self
    }

    func textAlignment(_ textAlignment: NSTextAlignment) -> StringBuilder {
        self.textAlignment = textAlignment
        return self
    }

    // MARK: -
    
    func build() -> NSAttributedString {
        // Create Paragraph Style
        let paragraphStyle = NSMutableParagraphStyle()
        
        // Configure Paragraph Style
        paragraphStyle.alignment = textAlignment
        
        // Define Attributes
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: fontName.font(of: size),
            .paragraphStyle: paragraphStyle
        ]
        
        return NSAttributedString(string: string, attributes: attributes)
    }
    
}
