//
//  UIViewController+Resolving.swift
//  Parcel
//
//  Created by Skibin Alexander on 10.11.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

#if !os(macOS)

import UIKit

extension UIViewController {
    
    // swiftlint:disable force_cast
    static public func resolveAsFromStoryboard<T>() -> T {
        UIStoryboard(
            name: self.className, bundle: nil
        )
        .instantiateViewController(withIdentifier: self.className) as! T
    }
    
}

#endif
