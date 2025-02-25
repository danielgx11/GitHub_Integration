//
//  DetailRepositoryEntity.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation

struct DetailRepositoryViewEntity {
    
    let items: [PullRequestEntity]
}

struct PullRequestEntity {
    let pullRequestUrl: URL?
    let title: String?
    let body: String?
    let state: PullRequestState
    let owner: ProfileEntity
    let createdAt: String
}

enum PullRequestState: String {
    case open = "open"
    case closed = "closed"
    case unknown
    
    init(state: String?) {
        self = PullRequestState(rawValue: state ?? "") ?? .unknown
    }
}
