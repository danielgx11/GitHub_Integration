//
//  UIView+Extension.swift
//
//
//  Created by Daniel Gomes Xavier on 20/02/25.
//

import Foundation
import UIKit

public protocol LayoutGuideProvider {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: LayoutGuideProvider { }
extension UILayoutGuide: LayoutGuideProvider { }

extension UIView {
    
    /// Constraints to its superview
    ///
    /// - Parameters
    ///     - top: Top constant. Default value is 0
    ///     - leading: Leading constant. Default value is 0
    ///     - trailing: Trailing constant. Default value is 0
    ///     - bottom: Bottom constant. Default value is 0
    public func constraintToSuperview(
        top: CGFloat = 0,
        leading: CGFloat = 0,
        trailing: CGFloat = 0,
        bottom: CGFloat = 0
    ) {
        guard let superview else {
            return
        }
        
        let layoutGuideProvider: LayoutGuideProvider = superview.safeAreaLayoutGuide
        
        let constraints = [
            topAnchor.constraint(equalTo: layoutGuideProvider.topAnchor, constant: top),
            leadingAnchor.constraint(equalTo: layoutGuideProvider.leadingAnchor, constant: leading),
            trailingAnchor.constraint(equalTo: layoutGuideProvider.trailingAnchor, constant: trailing),
            bottomAnchor.constraint(equalTo: layoutGuideProvider.bottomAnchor, constant: bottom)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @discardableResult
    public func topTo(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let top = topAnchor.constraint(equalTo: anchor, constant: constant)
        top.priority = priority
        top.isActive = true
        return self
    }
    
    @discardableResult
    public func topToGreater(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func topToLess(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func bottomTo(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func bottomToGreater(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func bottomToLess(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func leadingTo(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func leadingToGreater(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func leadingToLess(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func trailingTo(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func trailingToGreater(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func trailingToLess(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    public func centerXto(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func centerYto(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func width(_ constant: CGFloat) -> UIView {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func width(to anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> UIView {
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult
    public func height(_ constant: CGFloat) -> UIView {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func height(to anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> UIView {
        heightAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        return self
    }
}
