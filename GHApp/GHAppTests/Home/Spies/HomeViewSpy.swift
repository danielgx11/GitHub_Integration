//
//  HomeViewSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import UIKit

@testable import GHApp

final class HomeViewSpy: UIView, HomeViewProtocol {
    
    // MARK: - PROPERTIES
    
    var delegate: HomeViewDelegate?
    
    private(set) var updateViewCalled = false
    var viewState: HomeViewState?
    
    var content: UIView = UIView()
    
    // MARK: - METHODS

    func updateView(with state: HomeViewState) {
        updateViewCalled = true
        viewState = state
    }
}

extension HomeViewSpy {
    func verifyState(_ expectedState: HomeViewState) -> Bool {
        switch (viewState, expectedState) {
        case (.isLoading(let a), .isLoading(let b)),
             (.isTableViewLoading(let a), .isTableViewLoading(let b)):
            return a == b
        case (.hasError(let a), .hasError(let b)),
             (.hasPaginationError(let a), .hasPaginationError(let b)):
            return a == b
        case (.hasData(let entityA), .hasData(let entityB)):
            return entityA.repositories.count == entityB.repositories.count
        default:
            return false
        }
    }
}
