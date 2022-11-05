//
//  NibLoadable.swift
//  QRDynamic
//
//  Created by Skibin Alexander on 14.07.2020.
//  Copyright © 2020 VTB. All rights reserved.
//

#if !os(macOS)

import UIKit

public protocol NibLoadable { }

public extension NibLoadable where Self: UIView {
    
    static var nib: UINib {
        UINib(nibName: className, bundle: Bundle(for: self))
    }
    
    /// Загружаем вьюху из .xib файла и кастим к нужному типу
    static func instanceFromNib() -> Self {
        let results: [Any] = nib.instantiate(withOwner: self, options: nil)
        for result in results {
            if let view = result as? Self {
                return view
            }
        }
        fatalError("\(self) not found")
    }
}

#endif
