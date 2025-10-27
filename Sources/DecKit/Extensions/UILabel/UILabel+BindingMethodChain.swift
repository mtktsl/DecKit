//
//  UILabel+UIBinding.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit

public extension UILabel {
    
    @discardableResult func font(_ value: UIBinding<UIFont>) -> Self {
        onChange(of: value) { view, newValue in
            view?.font = newValue
        }
    }
    
    @discardableResult func text(_ value: UIBinding<String>) -> Self {
        onChange(of: value) { view, newValue in
            view?.text = newValue
        }
    }
    
    @discardableResult func textAlignment(_ value: UIBinding<NSTextAlignment>) -> Self {
        onChange(of: value) { view, newValue in
            view?.textAlignment = newValue
        }
    }
    
    @discardableResult func attributedText(_ value: UIBinding<NSAttributedString?>) -> Self {
        onChange(of: value) { view, newValue in
            view?.attributedText = newValue
        }
    }
    
    @discardableResult func textColor(_ value: UIBinding<UIColor>) -> Self {
        onChange(of: value) { view, newValue in
            view?.textColor = newValue
        }
    }
    
    @discardableResult func numberOfLines(_ value: UIBinding<Int>) -> Self {
        onChange(of: value) { view, newValue in
            view?.numberOfLines = newValue
        }
    }
    
    @discardableResult func lineBreakMode(_ value: UIBinding<NSLineBreakMode>) -> Self {
        onChange(of: value) { view, newValue in
            view?.lineBreakMode = newValue
        }
    }
}
