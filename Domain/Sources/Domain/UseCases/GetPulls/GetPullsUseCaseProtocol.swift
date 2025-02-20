//
//  GetPullsUseCaseProtocol.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

protocol GetPullsUseCaseProtocol {
    func execute(with request: RepositoryPullsRequest) async throws -> GetPullsUseCaseResponse
}
