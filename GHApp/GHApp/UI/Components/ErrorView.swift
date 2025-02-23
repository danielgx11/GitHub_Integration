//
//  ErrorView.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import UIKit
import Commons

final class ErrorView: UIView {
    
    // MARK: - UI
    
    @AutoLayoutUsage private var contentView: UIView = {
        let imageView = UIView()
        return imageView
    }()
    
    @AutoLayoutUsage private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "error-icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    @AutoLayoutUsage private var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.secondaryLabel
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    // MARK: - Properties
    
    var textMessage: String = "" {
        didSet {
            messageLabel.text = textMessage
        }
    }

    // MARK: - INITIALIZERS
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI SETUP
    
    private func setupUI() {
       setupViewHierarchy()
        setupConstraints()
    }
    
    private func setupViewHierarchy() {
        addSubview(contentView)
        
        contentView.addSubview(imageView)
        contentView.addSubview(messageLabel)
    }
    
    private func setupConstraints() {
        contentView.constraintToSuperview()
        
        imageView
            .centerXto(contentView.centerXAnchor)
            .centerYto(contentView.centerYAnchor, constant: Metrics.medium)
            .width(Metrics.huge)
            .height(Metrics.huge)
        
        messageLabel
            .topTo(imageView.bottomAnchor, constant: Metrics.little)
            .leadingTo(contentView.leadingAnchor, constant: Metrics.medium)
            .trailingTo(contentView.trailingAnchor, constant: -Metrics.medium)
            .bottomToLess(contentView.bottomAnchor, constant: -Metrics.tiny)
    }
}
