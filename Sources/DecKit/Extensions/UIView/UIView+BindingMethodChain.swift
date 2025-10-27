//
//  UIView+MethodChain.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func isHidden(_ value: UIBinding<Bool>) -> Self {
        onChange(of: value) { view, newValue in
            view?.isHidden = newValue
        }
    }
    
    @discardableResult
    func masksToBounds(_ value: UIBinding<Bool>) -> Self {
        onChange(of: value) { view, newValue in
            view?.layer.masksToBounds = newValue
        }
    }
    
    @discardableResult
    func clipsToBounds(_ value: UIBinding<Bool>) -> Self {
        onChange(of: value) { view, newValue in
            view?.clipsToBounds = newValue
        }
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ value: UIBinding<Bool>) -> Self {
        onChange(of: value) { view, newValue in
            view?.isUserInteractionEnabled = newValue
        }
    }
    
    @discardableResult
    func tag(_ value: UIBinding<Int>) -> Self {
        onChange(of: value) { view, newValue in
            view?.tag = newValue
        }
    }
    
    @discardableResult
    func contentMode(_ value: UIBinding<UIView.ContentMode>) -> Self {
        onChange(of: value) { view, newValue in
            view?.contentMode = newValue
        }
    }
    
    @discardableResult
    func tintColor(_ value: UIBinding<UIColor>) -> Self {
        onChange(of: value) { view, newValue in
            view?.tintColor = newValue
        }
    }
    
    @discardableResult
    func backgroundColor(_ value: UIBinding<UIColor>) -> Self {
        onChange(of: value) { view, newValue in
            view?.backgroundColor = newValue
        }
    }
    
    @discardableResult
    func opacity(_ value: UIBinding<Float>) -> Self {
        onChange(of: value) { view, newValue in
            view?.layer.opacity = newValue
        }
    }
    
    @discardableResult
    func cornerRadius(_ value: UIBinding<CGFloat>) -> Self {
        onChange(of: value) { view, newValue in
            view?.layer.cornerRadius = newValue
        }
    }
    
    @discardableResult
    func borderWidth(_ value: UIBinding<CGFloat>) -> Self {
        onChange(of: value) { view, newValue in
            view?.layer.borderWidth = newValue
        }
    }
    
    @discardableResult
    func borderColor(_ value: UIBinding<UIColor>) -> Self {
        onChange(of: value) { view, newValue in
            view?.layer.borderColor = newValue.cgColor
        }
    }
    
    @discardableResult
    func layoutMargins(_ value: UIBinding<UIEdgeInsets>) -> Self {
        
        if let stackView = self as? UIStackView {
            stackView.isLayoutMarginsRelativeArrangement = true
        }
        
        return onChange(of: value) { view, newValue in
            view?.layoutMargins = newValue
        }
    }
    
    @discardableResult
    func withContentHuggingPriority(
        _ priority: UIBinding<UILayoutPriority>,
        for axis: UIBinding<NSLayoutConstraint.Axis>
    ) -> Self {
        onChange(of: priority) { view, newValue in
            view?.setContentHuggingPriority(newValue, for: axis.wrappedValue)
        }
        .onChange(of: axis) { view, newValue in
            view?.setContentHuggingPriority(priority.wrappedValue, for: newValue)
        }
    }
    
    @discardableResult
    func withContentCompressionResistancePriority(
        _ priority: UIBinding<UILayoutPriority>,
        for axis: UIBinding<NSLayoutConstraint.Axis>
    ) -> Self {
        onChange(of: priority) { view, newValue in
            view?.setContentCompressionResistancePriority(newValue, for: axis.wrappedValue)
        }
        .onChange(of: axis) { view, newValue in
            view?.setContentCompressionResistancePriority(priority.wrappedValue, for: newValue)
        }
    }
}
