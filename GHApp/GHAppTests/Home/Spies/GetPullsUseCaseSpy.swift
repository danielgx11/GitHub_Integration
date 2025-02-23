//
//  GetPullsUseCaseSpy.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import Domain

final class GetPullsUseCaseSpy: GetPullsUseCaseProtocol {
    
    var shouldThrowError = false
    
    private(set) var fetchItemsCalled = false
    
    func execute(with request: RepositoriesRequest) async throws -> GetRepositoriesUseCaseResponse {
        fetchItemsCalled = true
        
        if shouldThrowError {
            throw MessageError.default
        }
        
        return GetRepositoriesUseCaseResponse.stub()
    }
    
}
