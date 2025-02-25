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
    func showAlert(with entity: AlertEntity)
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
    
    func showAlert(with entity: AlertEntity) {
        let alertController = UIAlertController(title: entity.title, message: entity.message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: entity.buttonTitle, style: .default)
        
        alertController.addAction(okButton)
        navigationController.present(alertController, animated: true)
    }
}
