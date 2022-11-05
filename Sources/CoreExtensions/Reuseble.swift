//
//  CoreCollections+Reuseble.swift
//  PaySaaS-iOS
//
//  Created by Скибин Александр on 27.04.2021.
//

#if !os(macOS)

import UIKit

/// This protocol only aggregates the needed properties for the extensions to work and avoid duplicated code.
public protocol Reusable: AnyObject {
    
    /// Returns `String(describing: self)` to be used as the `reuseIdentifier`.
    static var reuseIdentifier: String { get }
    
    /// Returns the UINib using the `String(describing: self)` as the name of the NIB.
    static var nib: UINib { get }
    
}

public extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
}

#endif
