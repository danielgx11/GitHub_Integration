//
//  HomeCoordinatorSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

@testable import GHApp

final class HomeCoordinatorSpy: HomeCoordinatorProtocol {
    
    private(set) var goToRepositoryCalled = false
    
    func goToRepositoryDetail(with entity: GHApp.RepositoryDetailEntity) {
        goToRepositoryCalled = true
    }
}
