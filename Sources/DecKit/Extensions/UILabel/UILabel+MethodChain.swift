//
//  UILabel+MethodChain.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit

public extension UILabel {
    
    @discardableResult
    func font(_ value: UIFont) -> Self {
        self.font = value
        return self
    }
    
    @discardableResult
    func text(_ value: String) -> Self {
        self.text = value
        return self
    }
    
    @discardableResult
    func textAlignment(_ value: NSTextAlignment) -> Self {
        self.textAlignment = value
        return self
    }
    
    @discardableResult
    func attributedText(_ value: NSAttributedString?) -> Self {
        DispatchQueue.main.async {
            self.attributedText = value
        }
        return self
    }
    
    @discardableResult
    func textColor(_ value: UIColor) -> Self {
        DispatchQueue.main.async {
            self.textColor = value
        }
        return self
    }
    
    @discardableResult
    func numberOfLines(_ value: Int) -> Self {
        self.numberOfLines = value
        return self
    }
    
    @discardableResult
    func lineBreakMode(_ value: NSLineBreakMode) -> Self {
        self.lineBreakMode = value
        return self
    }
    
    @discardableResult
    func minimumScaleFactor(_ value: CGFloat) -> Self {
        self.minimumScaleFactor = value
        return self
    }
}
