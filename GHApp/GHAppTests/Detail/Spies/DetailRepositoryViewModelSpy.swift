//
//  DetailRepositoryViewModelSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation

@testable import GHApp

final class DetailRepositoryViewModelSpy: DetailRepositoryViewModelProtocol {

    // MARK: - PROPERTIES
    
    private(set) var initStateCalled = false
    var viewState: DetailRepositoryViewState = .isLoading(true)
    
    // MARK: - METHODS
    
    func initState() {
        initStateCalled = true
    }

}

