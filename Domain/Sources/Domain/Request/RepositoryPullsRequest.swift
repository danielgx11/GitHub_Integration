//
//  RepositoryPullsRequest.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

public struct RepositoryPullsRequest: Encodable {
    public let owner: String
    public let repository: String
}
