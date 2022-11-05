//
//  NSObject+Identify.swift
//  Parcel
//
//  Created by Skibin Alexander on 08.05.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import Foundation

extension NSObject {
    public var className: String { return String(describing: type(of: self)) }
    static public var className: String { return String(describing: self) }
}
