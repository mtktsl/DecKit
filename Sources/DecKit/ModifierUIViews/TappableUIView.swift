//
//  TappableUIView.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//


import UIKit
import ShortConstraint

//MARK: Internal
final class TappableUIView: UIView {
    
    var onTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self
            .isUserInteractionEnabled(true)
            .withGestureRecognizer(
                UITapGestureRecognizer(
                    target: self,
                    action: #selector(tapGestureAction(_:))
                )
            )
    }
    
    @objc private func tapGestureAction(_ recognizer: UITapGestureRecognizer) {
        onTap?()
    }
    
    func addContent(view: UIView) {
        addSubview(view)
        view
            .constraint
            .fitting(to: self, insets: .zero)
            .activate()
    }
}
