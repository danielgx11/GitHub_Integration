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
        case .getRepositories:
            return "/repositories"
        case let .repositoriesPRs(request):
            return "/\(request.repository)/pulls"
        }
    }
    
    var method: String {
        switch self {
        case .getRepositories, .repositoriesPRs:
            return "GET"
        }
    }
    
    var queryParams: [String: Any]? {
        switch self {
        case let .getRepositories(repositoriesRequest):
            return [
                "q": "language:\(repositoriesRequest.language)",
                "sort": repositoriesRequest.sortItem,
                "page": repositoriesRequest.offset
            ]
        case .repositoriesPRs:
            return nil
        }
    }
}
