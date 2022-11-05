//
//  UITextView+Aligments.swift
//  Parcel
//
//  Created by Skibin Alexander on 07.12.2020.
//  Copyright © 2020 Skibin Development. All rights reserved.
//

#if !os(macOS)

import UIKit

extension UITextView {

    /// Выравнивание текста в TextView по вертикали
    public func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }

}

#endif
