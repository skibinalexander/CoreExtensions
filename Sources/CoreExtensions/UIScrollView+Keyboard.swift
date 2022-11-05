//
//  UIScrollView+Keyboard.swift
//  Parcel
//
//  Created by Skibin Alexander on 08.05.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

#if !os(macOS)

import UIKit

/// Хелпер для реализации offsets по высоте при появлении клавиатуры
extension UIViewController {
    
    public func registerForKeyboardWillShowNotification(
        _ scrollView: UIScrollView,
        usingBlock block: ((CGSize?) -> Void)? = nil
    ) {
        _ = NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil,
            using: { notification -> Void in
                let userInfo = notification.userInfo!
                let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue.size
                let contentInsets = UIEdgeInsets(
                    top: scrollView.contentInset.top,
                    left: scrollView.contentInset.left,
                    bottom: keyboardSize.height,
                    right: scrollView.contentInset.right)
                
                scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
                block?(keyboardSize)
            }
        )
    }
    
    public func registerForKeyboardWillHideNotification(
        _ scrollView: UIScrollView,
        usingBlock block: ((CGSize?) -> Void)? = nil
    ) {
        _ = NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil,
            using: { notification -> Void in
                let userInfo = notification.userInfo!
                let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue.size
                let contentInsets = UIEdgeInsets(
                    top: scrollView.contentInset.top,
                    left: scrollView.contentInset.left,
                    bottom: 0,
                    right: scrollView.contentInset.right
                )
                
                scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
                block?(keyboardSize)
            }
        )
    }
    
}

extension UIScrollView {
    
    public func setContentInsetAndScrollIndicatorInsets(_ edgeInsets: UIEdgeInsets) {
        self.contentInset = edgeInsets
        self.scrollIndicatorInsets = edgeInsets
    }
    
}

#endif
