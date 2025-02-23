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

protocol HomeCoordinatorProtocol { }

protocol HomeCoordinatorDelegate: AnyObject { }

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
        let viewController = factory.makeHomeViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - HomeViewControllerDelegate

extension HomeCoordinator: HomeViewControllerDelegate {
    
    func goToRepositoryDetail() {
        // TODO: go to details
    }
}
