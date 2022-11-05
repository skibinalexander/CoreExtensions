//
//  Localization.swift
//  PaySaaS-iOS
//
//  Created by Скибин Александр on 12.11.2021.
//

import Foundation

enum Localization: String {
    case ru
    case en
    
    static var current: Localization {
        Localization(rawValue: Locale.current.languageCode ?? "") ?? .en
    }
    
    static var currentLocale: Locale {
        Locale.current
    }
}
