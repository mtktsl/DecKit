//
//  DeclarativeUIView.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit

open class DeclarativeUIView: UIView {
    
    open var body: UIView {
        UIView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupContentView()
    }
    
    private func setupContentView() {
        let contentView = body
        addSubview(contentView)
        contentView
            .constraint
            .fitting(to: self, insets: .zero)
            .activate()
    }
}
