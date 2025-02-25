//
//  DetailRepositoryViewSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import UIKit

@testable import GHApp

final class DetailRepositoryViewSpy: UIView, DetailRepositoryViewProtocol {
    
    // MARK: - PROPERTIES
    
    var delegate: DetailRepositoryViewDelegate?
    
    private(set) var updateViewCalled = false
    var viewState: DetailRepositoryViewState?
    
    var content: UIView = UIView()
    
    // MARK: - METHODS

    func updateView(with state: DetailRepositoryViewState) {
        updateViewCalled = true
        viewState = state
    }
}

extension DetailRepositoryViewSpy {
    func verifyState(_ expectedState: DetailRepositoryViewState) -> Bool {
        switch (viewState, expectedState) {
        case (.isLoading(let a), .isLoading(let b)):
            return a == b
        case (.hasError(let a), .hasError(let b)):
            return a == b
        case (.hasData(let entityA), .hasData(let entityB)):
            return entityA.items.count == entityB.items.count
        default:
            return false
        }
    }
}
