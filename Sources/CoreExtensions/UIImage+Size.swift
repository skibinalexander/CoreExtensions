//
//  UIImage+Size.swift
//  UIImage+Size
//
//  Created by Скибин Александр on 02.09.2021.
//

import UIKit

extension UIImage {
    
    public func scaleToSize(aSize: CGSize) -> UIImage? {
        if (__CGSizeEqualToSize(self.size, aSize)) {
          return self
        }

        UIGraphicsBeginImageContextWithOptions(aSize, false, 0.0)
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: aSize.width, height: aSize.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
        
    }
}
