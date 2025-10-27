//
//  UIImageView+BindingMethodChain.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit

public extension UIImageView {
    
    @discardableResult
    func image(_ value: UIBinding<UIImage?>) -> Self {
        onChange(of: value) { view, newValue in
            view?.image = newValue
        }
    }
}
