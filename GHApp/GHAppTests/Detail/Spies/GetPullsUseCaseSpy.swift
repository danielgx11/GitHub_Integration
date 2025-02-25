//
//  GetPullsUseCaseSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import Domain

final class GetPullsUseCaseSpy: GetPullsUseCaseProtocol {
    
    var shouldThrowError = false

    private(set) var fetchItemsCalled = false

    func execute(with request: RepositoryPullsRequest) async throws -> [GetPullsUseCaseResponse] {
        fetchItemsCalled = true

        if shouldThrowError {
            throw MessageError.default
        }

        return [.stub()]
    }

}
