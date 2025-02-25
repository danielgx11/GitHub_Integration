//
//  GetRepositoriesUseCaseProtocol.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

public protocol GetRepositoriesUseCaseProtocol {
    func execute(with request: RepositoriesRequest) async throws -> GetRepositoriesUseCaseResponse
}
