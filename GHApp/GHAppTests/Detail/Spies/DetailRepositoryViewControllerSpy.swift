//
//  DetailRepositoryViewControllerSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import Domain

@testable import GHApp

final class DetailRepositoryViewControllerSpy: DetailRepositoryViewControllerProtocol {
    
    // MARK: - PROPERTIES
    
    private(set) var updateViewCalled = false
    private(set) var popViewCalled = false
    private(set) var viewState: DetailRepositoryViewState?
            
    // MARK: - METHODS
    
    func updateView(with viewState: DetailRepositoryViewState) {
        updateViewCalled = true
        self.viewState = viewState
    }
    
    func popView() {
        popViewCalled = true
    }

}

extension DetailRepositoryViewControllerSpy {
    func verifyState(_ expectedState: DetailRepositoryViewState) -> Bool {
        switch (viewState, expectedState) {
        case (.isLoading(let a), .isLoading(let b)):
            return a == b
        case (.hasError(let a), .hasError(let b)):
            return !(a.isEmpty && b.isEmpty)
        case (.hasData(let entityA), .hasData(let entityB)):
            return entityA.items.count == entityB.items.count
        default:
            return false
        }
    }
}
