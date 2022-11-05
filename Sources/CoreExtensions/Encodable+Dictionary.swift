//
//  Encodable+Dictionary.swift
//  PaySaaS-iOS
//
//  Created by Скибин Александр on 09.11.2021.
//

import Foundation

extension Encodable {
    
    public func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
    
}
