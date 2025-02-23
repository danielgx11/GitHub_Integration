//
//  GetRepositoriesUseCaseResponseStub.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import Domain

#if DEBUG

extension GetRepositoriesUseCaseResponse {
    
    static func stub() -> GetRepositoriesUseCaseResponse {
        .init(
            totalCount: 3,
            incompleteResults: false,
            items: [Repository.init(
                id: 1,
                name: "Alamofire",
                fullName: "Alamofire-iOS",
                owner: .init(login: "Alam", avatarURL: ""),
                description: "Code to implement Alamofire",
                stargazersCount: 3,
                forksCount: 3
            )]
        )
    }
}

#endif
