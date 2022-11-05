//
//  UILabel+Margin.swift
//  PaySaaS-iOS
//
//  Created by Скибин Александр on 21.06.2021.
//

#if !os(macOS)

import UIKit

extension UILabel {
    
    public func setMargins(margin: CGFloat = 12) {
        if let textString = self.text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = margin
            paragraphStyle.headIndent = margin
            paragraphStyle.tailIndent = -margin
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
    
}

#endif
