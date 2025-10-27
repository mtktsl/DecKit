//
//  UIStackView+MethodChain.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit
import ShortConstraint

//MARK: - Private helpers
private extension UIStackView {
    
    private static func buildFromConstraints(@ShortConstraintBuilder _ content: (_ containerStackView: UIView) -> [ShortConstraintProtocol]) -> Self {
        let stackView = Self(frame: .zero)
        let constraints = content(stackView)
        constraints.forEach { subconstraint in
            stackView.addArrangedSubview(subconstraint.sourceView)
        }
        
        constraints.forEach { subconstraint in
            subconstraint.activate()
        }
        
        return stackView
    }
}

//MARK: - Public builders
public extension UIStackView {
    
    static func vertical(
        spacing: CGFloat = .zero,
        alignment: UIStackView.Alignment = .fill,
        @UIViewBuilder _ content: () -> [UIView]
    ) -> Self {
        let stackView = Self(arrangedSubviews: content())
        stackView.axis = .vertical
        return stackView
            .alignment(alignment)
            .spacing(spacing)
    }
    
    static func horizontal(
        spacing: CGFloat = .zero,
        alignment: UIStackView.Alignment = .fill,
        @UIViewBuilder _ content: () -> [UIView]
    ) -> Self {
        let stackView = Self(arrangedSubviews: content())
        stackView.axis = .horizontal
        return stackView
            .alignment(alignment)
            .spacing(spacing)
    }
    
    static func verticalConstrained(
        spacing: CGFloat = .zero,
        alignment: UIStackView.Alignment = .fill,
        @ShortConstraintBuilder _ content: (_ containerStackView: UIView) -> [ShortConstraintProtocol]
    ) -> Self {
        let stackView = Self.buildFromConstraints(content)
        stackView.axis = .vertical
        return stackView
            .alignment(alignment)
            .spacing(spacing)
    }
    
    static func horizontalConstrained(
        spacing: CGFloat = .zero,
        alignment: UIStackView.Alignment = .fill,
        @ShortConstraintBuilder _ content: (_ containerStackView: UIView) -> [ShortConstraintProtocol]
    ) -> Self {
        let stackView = Self.buildFromConstraints(content)
        stackView.axis = .horizontal
        return stackView
            .alignment(alignment)
            .spacing(spacing)
    }
}

//MARK: - Public method chain
public extension UIStackView {
    
    @discardableResult
    func spacing(_ value: CGFloat) -> Self {
        self.spacing = value
        return self
    }
    
    @discardableResult
    func alignment(_ value: UIStackView.Alignment) -> Self {
        self.alignment = value
        return self
    }
    
    @discardableResult
    func distribution(_ value: UIStackView.Distribution) -> Self {
        self.distribution = value
        return self
    }
    
    @discardableResult
    func withCustomSpacing(_ value: CGFloat, afterIndex: Int) -> Self {
        guard !subviews.isEmpty && afterIndex >= 0 && afterIndex < subviews.count
        else { return self }
        
        setCustomSpacing(value, after: arrangedSubviews[afterIndex])
        return self
    }
    
    @discardableResult
    func withCustomSpacing(_ value: CGFloat, after targetView: UIView) -> Self {
        self.setCustomSpacing(value, after: targetView)
        return self
    }
}
