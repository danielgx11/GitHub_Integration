//
//  RepositoryCellViewEntityStub.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation

@testable import GHApp

extension RepositoryCellViewEntity {
    
    static func stub() -> RepositoryCellViewEntity {
        .init(
            repositoryInformation: .init(
                title: "Alamofire",
                description: "Code to implement Alamofire",
                forks: 3,
                stars: 3,
                profile: .init(image: nil,
                               name: "Alam",
                               type: "User")
            )
        )
    }
}
