//
//  DetailRepositoryViewState.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation

enum DetailRepositoryViewState {
    case hasData(DetailRepositoryViewEntity)
    case hasError(textMessage: String)
    case isLoading(Bool)
}
