//
//  DetailRepositoryViewModelTests.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import XCTest
import Domain

@testable import GHApp

final class DetailRepositoryViewModelTests: XCTestCase {
    
    // MARK: - PROPERTIES
    
    private var sut: DetailRepositoryViewModel!
    private var viewControllerSpy: DetailRepositoryViewControllerSpy!
    private var getPullsUseCaseSpy: GetPullsUseCaseSpy!
    private var factorySpy: DetailRepositoryViewFactorySpy!
    private var repositoryEntity: RepositoryDetailEntity!
    
    // MARK: - INITIALIZERS
    
    override func setUp() {
        super.setUp()
        getPullsUseCaseSpy = GetPullsUseCaseSpy()
        factorySpy = DetailRepositoryViewFactorySpy()
        viewControllerSpy = DetailRepositoryViewControllerSpy()
        repositoryEntity = RepositoryDetailEntity.stub()
        
        sut = DetailRepositoryViewModel(
            getPullsUseCase: getPullsUseCaseSpy,
            repositoryEntity: repositoryEntity,
            factory: factorySpy
        )
        sut.viewController = viewControllerSpy
    }
    
    override func tearDown() {
        sut = nil
        getPullsUseCaseSpy = nil
        factorySpy = nil
        viewControllerSpy = nil
        repositoryEntity = nil
        super.tearDown()
    }
    
    private func setupExpectation() async {
        let expectation = XCTestExpectation(description: "Aguardar finalização da tarefa asycn")

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 5)
    }
    
    // MARK: - TESTS
    
    func testInitStateShouldFetchPullRequests() async {
        sut.initState()
        
        await setupExpectation()
        
        XCTAssertTrue(getPullsUseCaseSpy.fetchItemsCalled, "O use case deveria ser chamado.")
    }
    
    func testInitStateShouldShowErrorMessage() async {
        getPullsUseCaseSpy.shouldThrowError = true
        
        sut.initState()
        
        await setupExpectation()
        
        XCTAssertTrue(
            viewControllerSpy.verifyState(
                .hasError(textMessage: MessageError.default.localizedDescription)
            ),
            "O estado esperado deveria ser de erro."
        )
    }
}
