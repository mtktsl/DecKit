//
//  BindingObservable.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//


import Foundation
import Combine

public protocol BindingObservable: AnyObject {
    
    @discardableResult
    func onChange<T>(
        of publisher: UIBinding<T>,
        dropFirst: Bool,
        debounceSeconds: TimeInterval?,
        action: @escaping (_ view: Self?, _ newValue: T) -> Void
    ) -> Self
}

public extension BindingObservable {
    
    @discardableResult
    func onChange<T>(
        of publisher: UIBinding<T>,
        dropFirst: Bool = false,
        debounceSeconds: TimeInterval? = nil,
        action: @escaping (_ view: Self?, _ newValue: T) -> Void
    ) -> Self {
        publisher.onChange(
            dropFirst: dropFirst,
            debounceSeconds: debounceSeconds
        ) { [weak self] newValue in
            action(self, newValue)
        }
        
        return self
    }
}
