//
//  UIImage+Initialization.swift
//  Parcel
//
//  Created by Skibin Alexander on 08.05.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

import UIKit

// MARK: - UIImageFromData+DefaultIcon

extension UIImage {
    
    // MARK: - Convience
    
    public convenience init(imageData: Data?, defaultName: String) {
        if let image = imageData {
            self.init(data: image)!
        } else {
            self.init(named: defaultName)!
        }
    }
    
    public convenience init?(named: String?) {
        guard let named = named else {
            return nil
        }
        
        self.init(named: named)
    }
    
    // MARK: - Static
    
    static public func imageView(view: UIImageView, imageName: String?, tint: UIColor) {
        let image: UIImage?
        if #available(iOS 13.0, *) {
            image = UIImage(named: imageName)?.withTintColor(tint)
            view.image = image
            view.tintColor = tint
        } else {
            image = UIImage(named: imageName)
            view.image = image
            view.tintColor = tint
        }
    }
    
}

extension UIImage {
    
    class func initFrom(color: UIColor) throws -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
            return image
        } else {
            throw NSError()
        }
    }
    
}
