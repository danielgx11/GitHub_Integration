//
//  HomeViewState.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import Foundation

enum HomeViewState {
    case hasData(HomeViewEntity)
    case hasLoadedMoreRepositories([RepositoryCellViewEntity])
    case hasError(textMessage: String)
    case hasPaginationError(textMessage: String)
    case isLoading(Bool)
    case isTableViewLoading(Bool)
}
