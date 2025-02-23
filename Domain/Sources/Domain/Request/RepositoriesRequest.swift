//
//  RepositoriesRequest.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

public struct RepositoriesRequest {
    
    public let language: String
    public let sortItem: String
    public let offset: Int
    
    public init(language: String, sortItem: String, offset: Int) {
        self.language = language
        self.sortItem = sortItem
        self.offset = offset
    }
}
