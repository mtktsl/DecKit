//
//  ShortConstraintBuilder.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 27.10.2025.
//

import ShortConstraint

@resultBuilder
public struct ShortConstraintBuilder {
    
    public static func buildBlock(_ components: ShortConstraintProtocol...) -> [ShortConstraintProtocol] {
        components
    }
}
