//
//  DetailRepositoryViewControllerTests.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import XCTest

@testable import GHApp

final class DetailRepositoryViewControllerTests: XCTestCase {
    
    // MARK: - PROPERTIES
    
    private var sut: DetailRepositoryViewController!
    private var viewModelSpy: DetailRepositoryViewModelSpy!
    private var contentViewSpy: DetailRepositoryViewSpy!
    private var coordinatorSpy: RepositoryDetailCoordinatorSpy!
    
    // MARK: - INITIALIZERS
    
    override func setUp() {
        super.setUp()
        viewModelSpy = DetailRepositoryViewModelSpy()
        contentViewSpy = DetailRepositoryViewSpy()
        coordinatorSpy = RepositoryDetailCoordinatorSpy()
        
        sut = DetailRepositoryViewController(
            viewModel: viewModelSpy,
            coordinator: coordinatorSpy,
            contentView: contentViewSpy
        )
    }
    
    override func tearDown() {
        sut = nil
        viewModelSpy = nil
        contentViewSpy = nil
        coordinatorSpy = nil
        super.tearDown()
    }
    
    // MARK: - TESTS
    
    func testViewDidLoadShouldInitializeCorrectly() {
        sut.viewDidLoad()
        XCTAssertEqual(sut.title, "Repository Detail", "O título deveria estar correto")
    }
    
    func testViewWillAppearShouldCallInitState() {
        sut.viewWillAppear(true)
        XCTAssertTrue(viewModelSpy.initStateCalled, "O método initState deveria ser chamado")
    }
    
    func testUpdateVieShouldCallContentViewUpdateView() {
        let expectedState: DetailRepositoryViewState = .isLoading(true)
        sut.updateView(with: expectedState)
        XCTAssertTrue(contentViewSpy.updateViewCalled, "O método updateView deveria ser chamado")
    }
    
    func testDidTapOpenWebViewShouldCallCoordinator() {
        let url = URL(string: "https://google.com")!
        sut.didTapOpenPRWebView(with: url)
        XCTAssertTrue(coordinatorSpy.goToWebViewCalled, "O método goToWebView deveria ser chamado")
    }
}
