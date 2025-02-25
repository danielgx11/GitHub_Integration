//
//  GetPullsUseCaseResponse.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

public struct GetPullsUseCaseResponse: Decodable {
    public let url: String?
    public let state: String?
    public let title: String?
    public let body: String?
    public let createdAt: String?
    public let owner: Owner?
    
    public init(
        url: String?,
        state: String?,
        title: String?,
        body: String?,
        createdAt: String?,
        owner: Owner?
    ) {
        self.url = url
        self.state = state
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.owner = owner
    }
    
    enum CodingKeys: String, CodingKey {
        case state, title, body
        case url = "html_url"
        case createdAt = "created_at"
        case owner = "user"
    }
}
