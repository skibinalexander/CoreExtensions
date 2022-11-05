//
//  UIImage+LocalUrl.swift
//  Cryptoner-iOS
//
//  Created by skibinalexander on 13.08.2022.
//

import UIKit

extension URL {
    
    public static func localURLForXCAsset(name: String) -> URL? {
        let fileManager = FileManager.default
        guard let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}
        let url = cacheDirectory.appendingPathComponent("\(name).png")
        let path = url.path
        if !fileManager.fileExists(atPath: path) {
            guard let image = UIImage(named: name), let data = image.pngData() else {return nil}
            fileManager.createFile(atPath: path, contents: data, attributes: nil)
        }
        return url
    }
    
}
