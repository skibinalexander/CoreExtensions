//
//  Date+Converters.swift
//  Parcel
//
//  Created by Skibin Alexander on 07.07.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import Foundation

extension Date {
    
    public func ms() -> UInt64 {
        UInt64(self.timeIntervalSince1970 * 1000)
    }
    
    public func sec() -> UInt64! {
        UInt64(self.timeIntervalSince1970)
    }
    
    public init(ms: UInt64) {
        self = Date(timeIntervalSince1970: TimeInterval(ms / 1000))
        self.addTimeInterval(TimeInterval(Double(ms % 1000) / 1000 ))
    }
    
    public init?(ms: UInt64?) {
        if let ms = ms {
            self = Date(timeIntervalSince1970: TimeInterval(ms / 1000))
            self.addTimeInterval(TimeInterval(Double(ms % 1000) / 1000 ))
        } else {
            return nil
        }
    }
    
}
