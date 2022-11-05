//
//  WKWebView+Cookies.swift
//  PaySaaS-iOS
//
//  Created by Скибин Александр on 06.08.2021.
//

import WebKit

extension WKWebView {

    public func cleanAllCookies() {
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        print("All cookies deleted")

        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                print("Cookie ::: \(record) deleted")
            }
        }
    }

    public func refreshCookies() {
        self.configuration.processPool = WKProcessPool()
    }
    
}
