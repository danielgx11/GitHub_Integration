//
//  AutoLayoutUsage.swift
//
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation
import UIKit

@propertyWrapper
public struct AutoLayoutUsage<T: UIView> {
    public var wrappedValue: T {
        didSet {
            setAutoLayout()
        }
    }
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        setAutoLayout()
    }
    func setAutoLayout() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
