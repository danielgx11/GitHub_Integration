//
//  RepositoriesRequestStub.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import Domain

#if DEBUG

extension RepositoriesRequest {
    
    static func stub() -> RepositoriesRequest {
        .init(
            language: "Swift",
            sortItem: "stars",
            offset: 1
        )
    }
}

#endif
