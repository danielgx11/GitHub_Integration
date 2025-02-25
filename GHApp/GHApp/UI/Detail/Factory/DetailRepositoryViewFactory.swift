//
//  DetailRepositoryViewFactory.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import Domain
import Commons

protocol DetailRepositoryViewFactoryProtocol: ViewFactoryProtocol {
    func buildViewEntity(with response: [GetPullsUseCaseResponse]) -> DetailRepositoryViewEntity
}

struct DetailRepositoryViewFactory: DetailRepositoryViewFactoryProtocol {
    
    func buildViewEntity(with response: [GetPullsUseCaseResponse]) -> DetailRepositoryViewEntity {
        .init(items: response.map { item in
                .init(
                    pullRequestUrl: URL(string: item.url ?? ""),
                    title: item.title,
                    body: item.body,
                    state: PullRequestState(state: item.state),
                    owner: ProfileEntity(
                        image: URL(string: item.owner?.avatarURL ?? ""),
                        name: item.owner?.login ?? "",
                        type: item.owner?.type
                    ),
                    createdAt: item.createdAt?.toBrazilianDateFormat() ?? Date().formatted()
                )
        })
    }
}
