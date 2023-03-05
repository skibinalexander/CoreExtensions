//
//  Decimal+.swift
//  
//
//  Created by skibinalexander on 03.03.2023.
//

import Foundation

extension Decimal {
    /// return 8 bytes of integer. LittleEndian  format
    var bytes8LE: [UInt8] {
        let int64value = (self.rounded(scale: 0) as NSDecimalNumber).intValue
        let bytes8 =  int64value.bytes8LE
        return Array(bytes8)
    }
    
    init?(_ string: String?) {
        guard let string = string else {
            return nil
        }
        
        self.init(string: string)
    }
    
    init?(_ int: Int?) {
        guard let int = int else {
            return nil
        }
        
        self.init(int)
    }
    
    init?(data: Data) {
        guard let uint64 = UInt64(data: data) else {
            return nil
        }
        
        self.init(uint64)
    }
    
    public mutating func round(scale: Int = 0, roundingMode: NSDecimalNumber.RoundingMode = .down) {
        var localCopy = self
        NSDecimalRound(&self, &localCopy, scale, roundingMode)
    }
    
    public func rounded(scale: Int = 0, roundingMode: NSDecimalNumber.RoundingMode = .down) -> Decimal {
        var result = Decimal()
        var localCopy = self
        NSDecimalRound(&result, &localCopy, scale, roundingMode)
        return result
    }
}
