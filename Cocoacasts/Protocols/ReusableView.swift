//
//  ReusableView.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 07/11/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

protocol ReusableView {

    static var reuseIdentifier: String { get }

}

extension ReusableView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }

}
