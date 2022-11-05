//
//  Bundle+Versions.swift
//  Parcel
//
//  Created by Skibin Alexander on 15.10.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import Foundation

public extension Bundle {
    
    var releaseVersionNumber: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildVersionNumber: String? {
        infoDictionary?["CFBundleVersion"] as? String
    }
    
}
