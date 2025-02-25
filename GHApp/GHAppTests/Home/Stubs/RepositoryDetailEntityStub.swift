//
//  RepositoryDetailEntityStub.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
@testable import GHApp

#if DEBUG

extension RepositoryDetailEntity {
    
    static func stub() -> RepositoryDetailEntity {
        .init(repository: "")
    }
}

#endif
