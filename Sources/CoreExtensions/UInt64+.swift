//
//  UInt64.swift
//  
//
//  Created by skibinalexander on 03.03.2023.
//

import Foundation

extension UInt64 {
    init?(data: Data) {
        guard data.count <= 8 else {
            return nil
        }
        
        let temp = NSData(bytes: data.reversed(), length: data.count)
        let rawPointer = UnsafeRawPointer(temp.bytes)
        let pointer = rawPointer.assumingMemoryBound(to: UInt64.self)
        self = pointer.pointee
    }
}
