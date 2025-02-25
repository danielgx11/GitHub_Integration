//
//  DetailRepositoryProtocols.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation

protocol DetailRepositoryViewDelegate: AnyObject { 
    
    func didTapOpenPRWebView(with pullRequestUrl: URL?)
}

protocol DetailRepositoryViewModelProtocol: AnyObject {
    
    var viewState: DetailRepositoryViewState { get }
    
    func initState()
}

protocol DetailRepositoryViewControllerProtocol: AnyObject {
    
    func updateView(with viewState: DetailRepositoryViewState)
    func popView()
}
