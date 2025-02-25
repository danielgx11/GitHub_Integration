//
//  DetailRepositoryViewEntityStub.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation

@testable import GHApp

extension DetailRepositoryViewEntity {
    
    static func stub() -> DetailRepositoryViewEntity {
        .init(
            items: [
                .stub()
            ]
        )
    }
}
