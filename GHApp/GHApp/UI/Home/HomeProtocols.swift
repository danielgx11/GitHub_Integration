//
//  HomeProtocols.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 21/02/25.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    func fetchMoreRepositories(page: Int)
    func didTapViewRepositoryPRsDetail(repository: String)
    func showAlert(message: String)
}

protocol HomeViewModelProtocol: AnyObject {
    
    var viewState: HomeViewState { get }
    
    func initState()
    func fetchMoreRepositories(page: Int)
    func makeRepositoryDetailEntity(repository: String) -> RepositoryDetailEntity
    func makeAlertEntity(message: String) -> AlertEntity
}

protocol HomeViewControllerProtocol: AnyObject {
    
    func updateView(with viewState: HomeViewState)
}
