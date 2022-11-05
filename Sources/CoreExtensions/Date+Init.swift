//
//  Date+Init.swift
//  PaySaaS-iOS
//
//  Created by Скибин Александр on 18.05.2021.
//

import Foundation

extension Date {
    
    public init(_ dateString: String) {
        self = Date.iso8601Formatter.date(from: dateString)!
    }
    
    public init?(_ dateString: String?) {
        guard let date = Date.iso8601Formatter.date(from: dateString ?? "") else {
            return nil
        }
        self = date
    }

    public static let iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [
            .withFullDate,
            .withTime,
            .withDashSeparatorInDate,
            .withColonSeparatorInTime
        ]
        return formatter
    }()
    
}
