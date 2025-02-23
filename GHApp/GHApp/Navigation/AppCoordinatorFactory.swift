//
//  AppCoordinatorFactory.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import UIKit

protocol AppCoordinatorFactoryProtocol {

    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator
}

struct AppCoordinatorFactory: AppCoordinatorFactoryProtocol {
    
    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator {
        let factory = HomeViewControllerFactory()
        let coordinator = HomeCoordinator(navigationController: navigationController, factory: factory)
        
        return coordinator
    }
}
