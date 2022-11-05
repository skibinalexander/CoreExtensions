//
//  Array+SafeExtension.swift
//  PaySaaS-iOS
//
//  Created by Скибин Александр on 10.11.2021.
//

import Foundation

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
