//
//  RepositoryDetailCoordinatorSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation

@testable import GHApp

final class RepositoryDetailCoordinatorSpy: DetailRepositoryCoordinatorProtocol {
    
    private(set) var goToWebViewCalled = false
    
    func goToWebView(with url: URL) {
        goToWebViewCalled = true
    }
}
