//
//  Optional+String.swift
//  PaySaaS-iOS
//
//  Created by Скибин Александр on 12.10.2021.
//

import Foundation

extension Optional where Wrapped == String {
    
    public var isNilOrEmpty: Bool {
        switch self {
        case .none:
            return true
        case .some(let value):
            return value.isEmpty
        }
    }
    
    public var isNil: Bool {
        self == .none
    }
    
    public var notEmpty: String? {
        return (self.isNilOrEmpty || self == "null") ? nil : self
    }
    
}

extension Optional where Wrapped == Int {
    
    public var isNil: Bool {
        self == .none
    }
    
}
