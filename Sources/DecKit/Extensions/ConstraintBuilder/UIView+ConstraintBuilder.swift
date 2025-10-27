//
//  UIView+ConstraintBuilder.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 27.10.2025.
//

import UIKit
import ShortConstraint

public extension UIView {
    static func container(@ShortConstraintBuilder _ content: (_ containerView: UIView) -> [ShortConstraintProtocol]) -> Self {
        let containerView = Self(frame: .zero)
        let shortConstraints = content(containerView)
        
        shortConstraints.forEach { constraint in
            containerView.addSubview(constraint.sourceView)
        }
        
        shortConstraints.forEach { constraint in
            constraint.activate()
        }
        
        return containerView
    }
}
