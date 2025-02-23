//
//  HomeViewControllerSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Domain

@testable import GHApp

final class HomeViewControllerSpy: HomeViewControllerProtocol {
    
    // MARK: - PROPERTIES
    
    private(set) var updateViewCalled = false
    private(set) var viewState: HomeViewState?
            
    // MARK: - METHODS
    
    func updateView(with viewState: HomeViewState) {
        updateViewCalled = true
        self.viewState = viewState
    }

}

extension HomeViewControllerSpy {
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
