//
//  UIBinding.swift
//  DecKit
//
//  Created by Metin Tarık Kiki on 25.10.2025.
//


import Foundation
import UIKit
import Combine

@propertyWrapper
public final class UIBinding<Value> {
    
    @Published private var currentValue: Value
    private var cancellables = Set<AnyCancellable>()
    private var subscriptIdentifiers = [ObjectIdentifier: Bool]()
    
    public var wrappedValue: Value {
        get {
            currentValue
        }
        set {
            currentValue = newValue
        }
    }
    
    public var projectedValue: UIBinding<Value> {
        self
    }
    
    public init(wrappedValue: Value) {
        self.currentValue = wrappedValue
    }
    
    public static func constant(_ value: Value) -> Self {
        return .init(wrappedValue: value)
    }
    
    public func onChange(
        dropFirst: Bool = false,
        debounceSeconds: TimeInterval? = nil,
        action: @escaping (_ newValue: Value) -> Void
    ) {
        if let debounceSeconds {
            if dropFirst {
                $currentValue
                    .dropFirst()
                    .debounce(
                        for: .seconds(debounceSeconds),
                        scheduler: RunLoop.main
                    )
                    .sink { newValue in
                        action(newValue)
                    }
                    .store(in: &cancellables)
            } else {
                $currentValue
                    .debounce(
                        for: .seconds(debounceSeconds),
                        scheduler: RunLoop.main
                    )
                    .sink { newValue in
                        action(newValue)
                    }
                    .store(in: &cancellables)
            }
        } else {
            if dropFirst {
                $currentValue
                    .dropFirst()
                    .sink { newValue in
                        action(newValue)
                    }
                    .store(in: &cancellables)
            } else {
                $currentValue
                    .sink { newValue in
                        action(newValue)
                    }
                    .store(in: &cancellables)
            }
        }
    }
}

extension UIBinding where Value: MutableCollection {
    public subscript(index: Value.Index) -> UIBinding<Value.Element> {
        let result = UIBinding<Value.Element>(wrappedValue: self.wrappedValue[index])
        
        self
            .onChange { [weak self] newValue in
                self?.subscriptIdentifiers[ObjectIdentifier(result)] = true
                result.wrappedValue = newValue[index]
            }
        
        result
            .onChange { [weak self] newValue in
                if self?.subscriptIdentifiers[ObjectIdentifier(result)] == false {
                    self?.wrappedValue[index] = newValue
                } else {
                    self?.subscriptIdentifiers[ObjectIdentifier(result)] = false
                }
            }
        
        return result
    }
}
