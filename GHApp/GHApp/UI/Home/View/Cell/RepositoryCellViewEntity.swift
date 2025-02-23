//
//  RepositoryCellViewEntity.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 20/02/25.
//

import Foundation

struct RepositoryCellViewEntity {
    let repositoryInformation: RepositoryInformation
    
    struct RepositoryInformation {
        let title: String
        let description: String?
        let forks: Int
        let stars: Int
        let profile: Profile?
    }
    
    struct Profile {
        let image: URL?
        let name: String
    }
}
