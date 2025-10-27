//
//  UIView+Modifier.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit

public extension UIView {
    
    func onTapGesture(_ action: @escaping () -> Void) -> UIView {
        let tappableView = TappableUIView()
        tappableView.addContent(view: self)
        tappableView.onTap = action
        return tappableView
    }
}
