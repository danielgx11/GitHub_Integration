//
//  PullRequestEntityStub.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import Foundation

@testable import GHApp

extension PullRequestEntity {
    
    static func stub() -> PullRequestEntity {
        .init(
            pullRequestUrl: nil,
            title: "PR 1",
            body: "PR 1 body",
            state: .open,
            owner: ProfileEntity.init(
                image: nil,
                name: "Alam",
                type: "User"
            ),
            createdAt: "2025-02-24T23:37:47Z"
        )
    }
}
