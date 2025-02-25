//
//  GetRepositoriesUseCase.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

public final class GetRepositoriesUseCase {
    
    let service: ServiceManagerProtocol
    
    public init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension GetRepositoriesUseCase: GetRepositoriesUseCaseProtocol {
    
    public func execute(with request: RepositoriesRequest) async throws -> GetRepositoriesUseCaseResponse {
        try await service.fetchRepositories(with: request)
    }
}
