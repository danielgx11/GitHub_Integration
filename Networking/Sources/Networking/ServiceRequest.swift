//
//  ServiceRequest.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Domain

enum ServiceRequest {
    
    case getRepositories(RepositoriesRequest)
    case repositoriesPRs(RepositoryPullsRequest)
    
    var baseUrl: String {
        switch self {
        case .getRepositories:
            return "https://api.github.com/search"
        case .repositoriesPRs:
            return "https://api.github.com/repos"
        }
    }
    
    var path: String {
        switch self {
        case let .getRepositories(request): // TODO: make it query params
            return "/repositories?q=language:\(request.language)&sort=stars&page=\(request.offset)"
        case let .repositoriesPRs(request):
            return "/\(request.owner)/\(request.repository)/pulls"
        }
    }
    
    var method: String {
        switch self {
        case .getRepositories, .repositoriesPRs:
            return "GET"
        }
    }
}
