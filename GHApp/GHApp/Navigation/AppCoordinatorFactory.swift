//
//  AppCoordinatorFactory.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import UIKit

protocol AppCoordinatorFactoryProtocol {

    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator
    func makeDetailCoordinator(navigationController: UINavigationController, entity: RepositoryDetailEntity) -> DetailRepositoryCoordinator
    func makeWebCoordinator(navigationController: UINavigationController, url: URL) -> WebViewCoordinator
}

struct AppCoordinatorFactory: AppCoordinatorFactoryProtocol {
    
    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator {
        let factory = HomeViewControllerFactory()
        let coordinator = HomeCoordinator(navigationController: navigationController, factory: factory)
        
        return coordinator
    }
    
    func makeDetailCoordinator(navigationController: UINavigationController, entity: RepositoryDetailEntity) -> DetailRepositoryCoordinator {
        let factory = DetailRepositoryViewControllerFactory()
        let coordinator = DetailRepositoryCoordinator(navigationController: navigationController, factory: factory, repositoryDetailEntity: entity)
        
        return coordinator
    }
    
    func makeWebCoordinator(navigationController: UINavigationController, url: URL) -> WebViewCoordinator {
        let factory = WebViewControllerFactory()
        let coordinator = WebViewCoordinator(
            navigationController: navigationController,
            factory: factory,
            url: url
        )
        
        return coordinator
    }
}
