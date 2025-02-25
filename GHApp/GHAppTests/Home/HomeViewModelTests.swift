//
//  HomeViewModelTests.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import XCTest
import Domain

@testable import GHApp

final class HomeViewModelTests: XCTestCase {
    
    // MARK: - PROPERTIES
    
    var getPullsUseCaseSpy: GetRepositoriesUseCaseSpy!
    var factorySpy: HomeViewFactorySpy!
    var viewControllerSpy: HomeViewControllerSpy!
    var sut: HomeViewModel!

    // MARK: - SETUP & TEARDOWN

    override func setUp() {
        super.setUp()
        getPullsUseCaseSpy = GetRepositoriesUseCaseSpy()
        factorySpy = HomeViewFactorySpy()
        viewControllerSpy = HomeViewControllerSpy()
        sut = HomeViewModel(getRepositoriesUseCase: getPullsUseCaseSpy, factory: factorySpy)
        sut.viewController = viewControllerSpy
    }

    override func tearDown() {
        getPullsUseCaseSpy = nil
        factorySpy = nil
        viewControllerSpy = nil
        sut = nil
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

    func testInitState_ShouldTriggerFetchRepositories() {
        sut.initState()
        
        XCTAssertTrue(viewControllerSpy.updateViewCalled, "O método updateView deveria ser chamado")
        XCTAssertTrue(viewControllerSpy.verifyState(.isLoading(true)), "O estado esperado deveria ser isLoading(true)")
    }
    
    func testFetchRepositoriesShouldReturnSuccess() async {
        getPullsUseCaseSpy.shouldThrowError = false

        sut.fetchMoreRepositories(page: 1)
        
        await setupExpectation()
        
        let response = try? await getPullsUseCaseSpy.execute(with: RepositoriesRequest.stub())
        let expectedEntity = factorySpy.buildViewEntity(with: response!)
        
        XCTAssertTrue(viewControllerSpy.updateViewCalled, "O método updateView deveria ser chamado")
        XCTAssertTrue(viewControllerSpy.verifyState(.hasData(expectedEntity)), "O estado esperado deveria ser hasData com a entity correta")
    }
    
    func testFetchRepositoriesShouldReturnError() async {
        getPullsUseCaseSpy.shouldThrowError = true

        sut.fetchMoreRepositories(page: 2)
        
        await setupExpectation()
        
        XCTAssertTrue(viewControllerSpy.updateViewCalled, "O método updateView deveria ser chamado")
        XCTAssertTrue(
            viewControllerSpy.verifyState(.hasPaginationError(textMessage: "Encontramos um erro ao tentar buscar a próxima pagina da listagem. Tente novamente")),
            "O estado esperado deveria ser hasError com a mensagem correta"
        )
    }

    func testPagination_ShouldTriggerCorrectState_WhenPageIsOne() async {
        sut.fetchMoreRepositories(page: 2)
        
        XCTAssertTrue(viewControllerSpy.updateViewCalled, "O método updateView deveria ser chamado")
        XCTAssertTrue(viewControllerSpy.verifyState(.isTableViewLoading(true)), "O estado esperado deveria ser isTableViewLoading(true)")
    }
    
    func testPagination_ShouldTriggerCorrectState_WhenPageIsGreaterThanOne() async {
        sut.fetchMoreRepositories(page: 2)
        
        XCTAssertTrue(viewControllerSpy.updateViewCalled, "O método updateView deveria ser chamado")
        XCTAssertTrue(viewControllerSpy.verifyState(.isTableViewLoading(true)), "O estado esperado deveria ser isTableViewLoading(true)")
    }
    
    func testPaginationError_ShouldTriggerCorrectState() async {
        getPullsUseCaseSpy.shouldThrowError = true
        
        sut.fetchMoreRepositories(page: 2)
                
        await setupExpectation()
                
        XCTAssertTrue(viewControllerSpy.updateViewCalled, "O método updateView deveria ser chamado")
        XCTAssertTrue(
            viewControllerSpy.verifyState(
            .hasPaginationError(textMessage: "Encontramos um erro ao tentar buscar a próxima pagina da listagem. Tente novamente")),
            "O estado esperado deveria ser hasPaginationError com a mensagem correta"
        )
    }
}
