//
//  RepositoriesRequest.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

public struct RepositoriesRequest: Encodable {
    
    public let language: String
    public let offset: Int
}
