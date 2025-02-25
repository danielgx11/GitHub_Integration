//
//  HomeViewFactory.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation
import Domain
import Commons

protocol HomeViewFactoryProtocol: ViewFactoryProtocol {
    
    func buildViewEntity(with data: GetRepositoriesUseCaseResponse) -> HomeViewEntity
    func buildRepositoryDetailEntity(repository: String) -> RepositoryDetailEntity
    func buildAlertEntity(with message: String) -> AlertEntity
}

struct HomeViewFactory: HomeViewFactoryProtocol {
    
    func buildViewEntity(with data: GetRepositoriesUseCaseResponse) -> HomeViewEntity {
        let repositories = makeRepositories(with: data.items)
        
        let entity = HomeViewEntity(totalPagesCount: data.totalCount, repositories: repositories)
        
        return entity
    }
    
    func buildRepositoryDetailEntity(repository: String) -> RepositoryDetailEntity {
        .init(repository: repository)
    }
    
    func buildAlertEntity(with message: String) -> AlertEntity {
        AlertEntity(
            title: "Ops",
            message: message,
            buttonTitle: "Done"
        )
    }
    
    private func makeRepositories(with data: [Repository]) -> [RepositoryCellViewEntity] {
        data.map { repo in
            let repository = makeRepository(with: repo)
            
            return RepositoryCellViewEntity(repositoryInformation: repository)
        }
    }
    
    private func makeRepository(with data: Repository) -> RepositoryCellViewEntity.RepositoryInformation {
        let profile = makeProfile(with: data.owner)

        let entity = RepositoryCellViewEntity.RepositoryInformation(
            title: data.fullName,
            description: data.description,
            forks: data.forksCount,
            stars: data.stargazersCount,
            profile: profile
        )
        
        return entity
    }
    
    private func makeProfile(with data: Owner) -> ProfileEntity {
        let imageUrl = URL(string: data.avatarURL)
        
        let entity = ProfileEntity(
            image: imageUrl,
            name: data.login,
            type: data.type
        )
        
        return entity
    }
}
