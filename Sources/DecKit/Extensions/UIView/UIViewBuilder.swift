//
//  UIViewBuilder.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//

import UIKit

@resultBuilder
@MainActor
public struct UIViewBuilder {
    
    public static func buildBlock(_ views: UIView...) -> [UIView] {
        views
    }
}
