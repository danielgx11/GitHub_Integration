//
//  DetailRepositoryCoordinator.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import Networking
import UIKit
import Domain

protocol DetailRepositoryCoordinatorProtocol { 
    
    func goToWebView(with url: URL)
    func popView()
}

protocol DetailRepositoryCoordinatorDelegate: AnyObject {
    func goToWebView(with url: URL)
}

final class DetailRepositoryCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
    
    var navigationController: UINavigationController
    var factory: DetailRepositoryViewControllerFactoryProtocol
    
    weak var delegate: DetailRepositoryCoordinatorDelegate?
    
    private var repositoryDetailEntity: RepositoryDetailEntity
    
    // MARK: - INITIALIZERS
    
    init(
        navigationController: UINavigationController,
        factory: DetailRepositoryViewControllerFactoryProtocol,
        repositoryDetailEntity: RepositoryDetailEntity
    ) {
        self.navigationController = navigationController
        self.factory = factory
        self.repositoryDetailEntity = repositoryDetailEntity
    }
    
    // MARK: - METHODS
    
    func start() {
        let viewController = factory.makeDetailRepositoryViewController(coordinator: self, repositoryDetailEntity: repositoryDetailEntity)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - DetailRepositoryCoordinatorProtocol

extension DetailRepositoryCoordinator: DetailRepositoryCoordinatorProtocol {
    
    func goToWebView(with url: URL) {
        delegate?.goToWebView(with: url)
    }

    func popView() {
        navigationController.popViewController(animated: true)
    }
}
