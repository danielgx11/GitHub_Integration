//
//  HomeCoordinator.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 21/02/25.
//

import Foundation
import Networking
import UIKit
import Domain

protocol HomeCoordinatorProtocol {
    func goToRepositoryDetail(with entity: RepositoryDetailEntity) 
}

protocol HomeCoordinatorDelegate: AnyObject {
    
    func goToRepositoryDetail(with entity: RepositoryDetailEntity)
}

final class HomeCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
    
    var navigationController: UINavigationController
    var factory: HomeViewControllerFactoryProtocol
    
    weak var delegate: HomeCoordinatorDelegate?
    
    // MARK: - INITIALIZERS
    
    init(navigationController: UINavigationController, factory: HomeViewControllerFactoryProtocol) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    // MARK: - METHODS
    
    func start() {
        let viewController = factory.makeHomeViewController(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - HomeCoordinatorProtocol

extension HomeCoordinator: HomeCoordinatorProtocol {
    
    func goToRepositoryDetail(with entity: RepositoryDetailEntity) {
        delegate?.goToRepositoryDetail(with: entity)
    }
}
