//
//  HomeViewEntityStub.swift
//  GHAppTests
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation

@testable import GHApp

#if DEBUG

extension HomeViewEntity {
    
    static func stub() -> HomeViewEntity {
        .init(totalPagesCount: 2,
              repositories: [RepositoryCellViewEntity.stub()])
    }
}

#endif
