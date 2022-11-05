//
//  UIViewController+Wrapper.swift
//  Parcel
//
//  Created by Skibin Alexander on 22.07.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

#if !os(macOS)

import UIKit

extension UIViewController {
    
    /// Добавить контроллер в сабвью родительского контроллера.
    /// По-умолчанию в корневую view
    public func addChildAsSubview(_ viewController: UIViewController, in view: UIView? = nil) {
        (view ?? self.view)?.addSubview(viewController.view)
        
        viewController.view.fillToSuperview()
        
        viewController.willMove(toParent: self)
        addChild(viewController)
        viewController.didMove(toParent: self)
    }
    
    /// Удалить контроллер в сабвью родительского контроллера.
    /// По-умолчанию в корневую view
    public func removeChildAsSubview(_ viewController: UIViewController?) {
        viewController?.willMove(toParent: nil)
        viewController?.view.removeFromSuperview()
        viewController?.removeFromParent()
    }
    
}

#endif
