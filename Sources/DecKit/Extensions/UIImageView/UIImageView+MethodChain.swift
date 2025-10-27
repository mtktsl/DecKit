//
//  UIImageView+MethodChain.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit

public extension UIImageView {
    
    @discardableResult
    func image(_ value: UIImage?) -> Self {
        self.image = value
        return self
    }
}
