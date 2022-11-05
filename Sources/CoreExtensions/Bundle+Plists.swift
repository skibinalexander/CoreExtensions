//
//  Bundle+Plists.swift
//  Parcel
//
//  Created by Skibin Alexander on 08.05.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import Foundation

extension Bundle {
    
    public func getInfoPlist() -> [String: AnyObject]? {
        var propertyListFormat = PropertyListSerialization.PropertyListFormat.xml //Format of the Property List.
        if let plistPath = Bundle.main.path(forResource: "Info", ofType: "plist") {
            let plistXML = FileManager.default.contents(atPath: plistPath)!
            do {//convert the data to a dictionary and handle errors.
                return try PropertyListSerialization.propertyList(
                    from: plistXML,
                    options: .mutableContainersAndLeaves,
                    format: &propertyListFormat
                ) as? [String: AnyObject]
            } catch {
                print("Error reading plist: \(error), format: \(propertyListFormat)")
                return nil
            }
        }
        
        return nil
    }
    
    public func getPlist(with name: String) -> [String: AnyObject]? {
        var propertyListFormat = PropertyListSerialization.PropertyListFormat.xml //Format of the Property List.
        if let plistPath = Bundle.main.path(forResource: name, ofType: "plist") {
            let plistXML = FileManager.default.contents(atPath: plistPath)!
            do {//convert the data to a dictionary and handle errors.
                return try PropertyListSerialization.propertyList(
                    from: plistXML,
                    options: .mutableContainersAndLeaves,
                    format: &propertyListFormat
                ) as? [String: AnyObject]
            } catch {
                print("Error reading plist: \(error), format: \(propertyListFormat)")
                return nil
            }
        }
        
        return nil
    }
    
}
