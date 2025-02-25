//
//  HomeViewModelSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation

@testable import GHApp

final class HomeViewModelSpy: HomeViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    private(set) var initStateCalled = false
    private(set) var fetchMoreRepositoriesCalled = false
    private(set) var fetchMoreRepositoriesPage: Int?
    var viewState: HomeViewState = .isLoading(true)
    
    // MARK: - METHODS
    
    func initState() {
        initStateCalled = true
    }
    
    func fetchMoreRepositories(page: Int) {
        fetchMoreRepositoriesCalled = true
        fetchMoreRepositoriesPage = page
    }
    
    func makeRepositoryDetailEntity(repository: String) -> RepositoryDetailEntity {
        return RepositoryDetailEntity(repository: repository)
    }
}
