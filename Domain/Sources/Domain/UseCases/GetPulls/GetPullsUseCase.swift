//
//  GetPullsUseCase.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

public final class GetPullsUseCase {
    let service: ServiceManagerProtocol
    
    public init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension GetPullsUseCase: GetPullsUseCaseProtocol {
    
    public func execute(with request: RepositoryPullsRequest) async throws -> [GetPullsUseCaseResponse] {
        try await service.fetchPullsForRepository(with: request)
    }
}
