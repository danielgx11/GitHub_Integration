//
//  GetRepositoriesUseCaseResponse.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

public struct GetRepositoriesUseCaseResponse: Decodable {
    public let totalCount: Int
    public let incompleteResults: Bool
    public let items: [Repository]
    
    public init(totalCount: Int, incompleteResults: Bool, items: [Repository]) {
        self.totalCount = totalCount
        self.incompleteResults = incompleteResults
        self.items = items
    }
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

public struct Repository: Decodable {
    public let id: Int
    public let name: String
    public let fullName: String
    public let owner: Owner
    public let description: String?
    public let stargazersCount: Int
    public let forksCount: Int
    
    public init(
        id: Int,
        name: String,
        fullName: String,
        owner: Owner,
        description: String?,
        stargazersCount: Int,
        forksCount: Int
    ) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.owner = owner
        self.description = description
        self.stargazersCount = stargazersCount
        self.forksCount = forksCount
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, owner, description
        case fullName = "full_name"
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
    }
}

public struct Owner: Decodable {
    public let login: String
    public let avatarURL: String
    
    public init(login: String, avatarURL: String) {
        self.login = login
        self.avatarURL = avatarURL
    }
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
