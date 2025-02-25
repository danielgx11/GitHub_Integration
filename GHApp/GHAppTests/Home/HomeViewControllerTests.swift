//
//  HomeViewControllerTests.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import XCTest
@testable import GHApp

final class HomeViewControllerTests: XCTestCase {
    
    // MARK: - PROPERTIES
    
    private var viewModelSpy: HomeViewModelSpy!
    private var contentViewSpy: HomeViewSpy!
    private var coordinatorSpy: HomeCoordinatorSpy!
    private var sut: HomeViewController!
    
    // MARK: - INITIALIZERS
    
    override func setUp() {
        super.setUp()
        viewModelSpy = HomeViewModelSpy()
        contentViewSpy = HomeViewSpy()
        coordinatorSpy = HomeCoordinatorSpy()
        sut = HomeViewController(viewModel: viewModelSpy, coordinator: coordinatorSpy, contentView: contentViewSpy)
    }
    
    override func tearDown() {
        sut = nil
        viewModelSpy = nil
        contentViewSpy = nil
        coordinatorSpy = nil
        super.tearDown()
    }
    
    // MARK: - TESTS
    
    func test_viewDidLoad_ShouldInitializeCorrectly() {
        sut.viewDidLoad()
        
        XCTAssertEqual(sut.title, "Repositories", "O título deveria ser 'Repositories'")
        XCTAssertEqual(contentViewSpy.delegate as? HomeViewController, sut, "O contentView.delegate deveria ser a própria ViewController")
    }
    
    func test_viewWillAppear_ShouldCallViewModelInitState() {
        sut.viewWillAppear(true)
        
        XCTAssertTrue(viewModelSpy.initStateCalled, "O método initState() deveria ter sido chamado")
    }
    
    func test_fetchMoreRepositories_ShouldCallViewModelFetchMoreRepositories() {
        let page = 2
        
        sut.fetchMoreRepositories(page: page)
        
        XCTAssertTrue(viewModelSpy.fetchMoreRepositoriesCalled, "O método fetchMoreRepositories deveria ser chamado")
        XCTAssertEqual(viewModelSpy.fetchMoreRepositoriesPage, page, "O parâmetro da página deveria ser \(page)")
    }
    
    func test_didTapViewRepositoryPRsDetail_ShouldCallCoordinator() {
        let repository = "apple/swift"
        
        sut.didTapViewRepositoryPRsDetail(repository: repository)
        
        XCTAssertTrue(coordinatorSpy.goToRepositoryCalled, "O método goToRepositoryDetail deveria ter sido chamado")
    }
    
    func test_updateView_ShouldCallContentViewUpdateView() {
        let viewState = HomeViewState.isLoading(true)
        
        sut.updateView(with: viewState)
        
        XCTAssertTrue(contentViewSpy.updateViewCalled, "O método updateVieqq deveria ser chamado")
        XCTAssertTrue(contentViewSpy.verifyState(viewState), "O estado da viewState deveria ser atualizado corretamente")
    }
}
