//
//  HomeViewFactorySpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

@testable import GHApp

import Domain

final class HomeViewFactorySpy: HomeViewFactoryProtocol {

    private(set) var buildEntityCalled = false
    private(set) var buildRepositoryDetailEntityCalled = false
    
    func buildViewEntity(with data: GetRepositoriesUseCaseResponse) -> HomeViewEntity {
        buildEntityCalled = true
        return .stub()
    }
    
    func buildRepositoryDetailEntity(repository: String) -> RepositoryDetailEntity {
        buildRepositoryDetailEntityCalled = true
        return .stub()
    }
    
    func buildAlertEntity(with message: String) -> AlertEntity {
        .init(title: "", message: "", buttonTitle: "")
    }
}
