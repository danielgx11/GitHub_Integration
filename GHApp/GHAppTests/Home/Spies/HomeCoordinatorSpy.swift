//
//  HomeCoordinatorSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

@testable import GHApp

final class HomeCoordinatorSpy: HomeCoordinatorProtocol {
    
    private(set) var goToRepositoryCalled = false
    private(set) var showAlertCalled = false
    
    func goToRepositoryDetail(with entity: GHApp.RepositoryDetailEntity) {
        goToRepositoryCalled = true
    }
    
    func showAlert(with entity: AlertEntity) {
        showAlertCalled = true
    }
}
