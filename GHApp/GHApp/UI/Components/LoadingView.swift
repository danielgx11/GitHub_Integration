//
//  LoadingView.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import UIKit
import Commons

final class LoadingView: UIView {
    
    // MARK: - UI
    
    @AutoLayoutUsage private var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    var isLoading: Bool = false {
        didSet {
            isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
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
    
    // MARK: - METHODS
    
    private func setupUI() {
        setupViewHierarchy()
        setupConstraints()
    }
    
    private func setupViewHierarchy() {
        addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        activityIndicator
            .centerXto(centerXAnchor)
            .centerYto(centerYAnchor)
    }
}
