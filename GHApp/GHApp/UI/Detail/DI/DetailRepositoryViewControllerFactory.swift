//
//  DetailRepositoryViewControllerFactory.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import Domain
import Networking
import UIKit

struct DetailRepositoryViewControllerFactory: DetailRepositoryViewControllerFactoryProtocol {
    
    func makeDetailRepositoryViewController(
        coordinator: DetailRepositoryCoordinatorProtocol,
        repositoryDetailEntity: RepositoryDetailEntity
    ) -> UIViewController {
        let service = ServiceManager()
        let getPullsUseCase = GetPullsUseCase(service: service)
        let factory = DetailRepositoryViewFactory()
        let viewModel = DetailRepositoryViewModel(
            getPullsUseCase: getPullsUseCase,
            repositoryEntity: repositoryDetailEntity,
            factory: factory
        )
        
        let viewController = DetailRepositoryViewController(viewModel: viewModel, coordinator: coordinator)
        
        viewModel.viewController = viewController
                        
        return viewController
    }
}
