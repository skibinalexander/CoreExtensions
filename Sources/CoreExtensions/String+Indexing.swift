//
//  String+Indexing.swift
//  Parcel
//
//  Created by Skibin Alexander on 29.11.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import Foundation

extension String {
    
    public var isBackspace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
    
}

extension String.Index {
    public func distance<S: StringProtocol>(in string: S) -> Int { string.distance(to: self) }
}

extension Collection {
    public func distance(to index: Index) -> Int { distance(from: startIndex, to: index) }
}

extension StringProtocol {
    public func indexDistance(of element: Element) -> Int? { firstIndex(of: element)?.distance(in: self) }
    public func indexDistance<S: StringProtocol>(of string: S) -> Int? { range(of: string)?.lowerBound.distance(in: self) }
}

extension String {
    
    /// Удалить из строки символы не валидные для имени файла
    public func prepareFileName() -> String {
        var invalidCharacters = CharacterSet(charactersIn: ":/")
        invalidCharacters.formUnion(.newlines)
        invalidCharacters.formUnion(.illegalCharacters)
        invalidCharacters.formUnion(.controlCharacters)

        return self
            .components(separatedBy: invalidCharacters)
            .joined(separator: "")
    }
    
}
