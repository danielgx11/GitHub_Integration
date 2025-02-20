//
//  GetRepositoriesUseCase.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

final class GetRepositoriesUseCase {
    
    let service: ServiceManagerProtocol
    
    init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension GetRepositoriesUseCase: GetRepositoriesUseCaseProtocol {
    
    func execute(with request: RepositoriesRequest) async throws -> GetRepositoriesUseCaseResponse {
        try await service.fetchRepositories(with: request)
    }
}
