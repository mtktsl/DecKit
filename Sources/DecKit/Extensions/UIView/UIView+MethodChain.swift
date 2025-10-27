//
//  UIView+MethodChain.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func isHidden(_ value: Bool) -> Self {
        self.isHidden = value
        return self
    }
    
    @discardableResult
    func masksToBounds(_ value: Bool) -> Self {
        self.layer.masksToBounds = value
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ value: Bool) -> Self {
        self.clipsToBounds = value
        return self
    }
    
    @discardableResult
    func withGestureRecognizer(_ value: UITapGestureRecognizer) -> Self {
        self.addGestureRecognizer(value)
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ value: Bool) -> Self {
        self.isUserInteractionEnabled = value
        return self
    }
    
    @discardableResult
    func tag(_ value: Int) -> Self {
        self.tag = value
        return self
    }
    
    @discardableResult
    func contentMode(_ value: UIView.ContentMode) -> Self {
        self.contentMode = value
        return self
    }
    
    @discardableResult
    func tintColor(_ value: UIColor) -> Self {
        self.tintColor = value
        return self
    }
    
    @discardableResult
    func backgroundColor(_ value: UIColor) -> Self {
        self.backgroundColor = value
        return self
    }
    
    @discardableResult
    func opacity(_ value: Float) -> Self {
        self.layer.opacity = value
        return self
    }
    
    @discardableResult
    func cornerRadius(_ value: CGFloat) -> Self {
        self.layer.cornerRadius = value
        return self
    }
    
    @discardableResult
    func borderWidth(_ value: CGFloat) -> Self {
        self.layer.borderWidth = value
        return self
    }
    
    @discardableResult
    func borderColor(_ value: UIColor) -> Self {
        self.layer.borderColor = value.cgColor
        return self
    }
    
    @discardableResult
    func layoutMargins(_ value: UIEdgeInsets) -> Self {
        
        if let stackView = self as? UIStackView {
            stackView.isLayoutMarginsRelativeArrangement = true
        }
        
        layoutMargins = value
        return self
    }
    
    @discardableResult
    func withContentHuggingPriority(
        _ priority: UILayoutPriority,
        for axis: NSLayoutConstraint.Axis
    ) -> Self {
        self.setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func withContentCompressionResistancePriority(
        _ priority: UILayoutPriority,
        for axis: NSLayoutConstraint.Axis
    ) -> Self {
        self.setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
}
