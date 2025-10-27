//
//  DeclarativeUIViewController.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit

public extension DeclarativeViewController {
    
    enum BodyEdge {
        case leading
        case top
        case trailing
        case bottom
    }
}

open class DeclarativeViewController: UIViewController {
    
    open var ignoreSafeAreForBodyView: Set<BodyEdge> {
        []
    }
    
    open var body: UIView {
        UIView()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let contentView = body
        view.addSubview(contentView)
        
        contentView
            .constraint
            .leading(
                equalTo: ignoreSafeAreForBodyView.contains(.leading)
                ? view.leadingAnchor
                : view.safeAreaLayoutGuide.leadingAnchor
            )
            .top(
                equalTo: ignoreSafeAreForBodyView.contains(.top)
                ? view.topAnchor
                : view.safeAreaLayoutGuide.topAnchor
            )
            .trailing(
                equalTo: ignoreSafeAreForBodyView.contains(.trailing)
                ? view.trailingAnchor
                : view.safeAreaLayoutGuide.trailingAnchor
            )
            .bottom(
                equalTo: ignoreSafeAreForBodyView.contains(.bottom)
                ? view.bottomAnchor
                : view.safeAreaLayoutGuide.bottomAnchor
            )
            .activate()
    }
}
