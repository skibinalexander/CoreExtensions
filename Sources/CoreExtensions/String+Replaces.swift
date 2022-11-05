//
//  String+Replaces.swift
//  Parcel
//
//  Created by Скибин Александр on 20.01.2021.
//  Copyright © 2021 Skibin Development. All rights reserved.
//

import Foundation

extension String {
    
    /// Удаление символов
    /// - Parameter range: Bounds для удаление
    mutating func deleteCharactersInRange(range: NSRange) {
        let mutableSelf = NSMutableString(string: self)
        mutableSelf.deleteCharacters(in: range)
        self = mutableSelf as String
    }
    
}
