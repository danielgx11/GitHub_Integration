//
//  GetRepositoryPullsUseCaseResponseStub.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import Domain

extension GetPullsUseCaseResponse {
    
    static func stub() -> GetPullsUseCaseResponse {
        .init(
            url: "",
            state: "open",
            title: "PR 1",
            body: "PR 1 body",
            createdAt: "2025-02-24T23:37:47Z",
            owner: .init(
                login: "Alam",
                avatarURL: "",
                type: "User"
            )
        )
    }
}
