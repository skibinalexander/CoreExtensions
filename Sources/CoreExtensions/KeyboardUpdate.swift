//
//  KeyboardUpdate.swift
//  Parcel
//
//  Created by Skibin Alexander on 04.10.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

#if !os(macOS)
import UIKit

public struct KeyboardUpdate {

    /// Время анимации
    public let duration: TimeInterval
    
    /// Опции анимации
    public let options: UIView.AnimationOptions
    
    /// Высота клавиатуры
    public let padding: CGFloat

    public init?(notification: Notification, in view: UIView? = nil) {
        guard
            let userInfo = (notification as NSNotification).userInfo as? [String: Any]
        else {
            return nil
        }
        guard let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let keyboardEndFrame =
                (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let animationCurve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt
        else {
            return nil
        }

        let padding = KeyboardUpdate.paddingForFrame(keyboardEndFrame, in: view?.frame)
        let options = UIView.AnimationOptions(rawValue: (animationCurve as UInt) << 16)

        self.duration = duration
        self.options = options
        self.padding = padding
    }

    private static func paddingForFrame(_ keyboardFrame: CGRect, in viewFrame: CGRect?) -> CGFloat {
        let endYPosition = keyboardFrame.origin.y
        let keyboardHeight = keyboardFrame.height
        let windowHeight = viewFrame?.height ?? UIApplication.shared.keyWindow?.frame.height ?? .zero
        let padding = endYPosition >= windowHeight ? 0.0 : keyboardHeight

        return padding
    }
}

extension UIViewController {
    
    public func enableKeyboardWhenTappedAround(_ completion: ((UITapGestureRecognizer) -> Void)? = nil) {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
    }
    
    public func disableKeyboardWhenTappedAround(with tapGesture: UITapGestureRecognizer) {
        view.removeGestureRecognizer(tapGesture)
    }
    
    @objc public func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
#endif
