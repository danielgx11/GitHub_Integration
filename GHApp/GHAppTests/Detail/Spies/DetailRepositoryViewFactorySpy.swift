//
//  DetailRepositoryViewFactorySpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

@testable import GHApp

import Domain

final class DetailRepositoryViewFactorySpy: DetailRepositoryViewFactoryProtocol {

    private(set) var buildEntityCalled = false
    
    func buildViewEntity(with response: [Domain.GetPullsUseCaseResponse]) -> GHApp.DetailRepositoryViewEntity {
        buildEntityCalled = true
        return .stub()
    }
    
}
