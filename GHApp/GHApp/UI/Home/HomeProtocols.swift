//
//  HomeProtocols.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 21/02/25.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    func fetchMoreRepositories(page: Int)
}

protocol HomeViewControllerDelegate: AnyObject {
    
    func goToRepositoryDetail()
}

protocol HomeViewModelProtocol: AnyObject {
    
    var viewState: HomeViewState { get }
    
    func initState()
    func fetchMoreRepositories(page: Int)
}

protocol HomeViewControllerProtocol: AnyObject {
    
    func updateView(with viewState: HomeViewState)
}
