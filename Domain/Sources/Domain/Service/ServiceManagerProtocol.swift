//
//  ServiceManagerProtocol.swift
//  
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

public protocol ServiceManagerProtocol {
    func fetchRepositories(with request: RepositoriesRequest) async throws -> GetRepositoriesUseCaseResponse
    func fetchPullsForRepository(with request: RepositoryPullsRequest) async throws -> [GetPullsUseCaseResponse]
}
