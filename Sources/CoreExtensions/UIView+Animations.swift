//
//  UIView+Animations.swift
//  Parcel
//
//  Created by Skibin Alexander on 08.05.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

#if !os(macOS)

import UIKit

extension UIView {
    
    public func horizontalShake(durationAnimation: Double, repeatAnimation: Float) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = durationAnimation
        animation.repeatCount = repeatAnimation
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 8, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 8, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }
    
}

#endif
