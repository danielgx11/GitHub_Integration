//
//  HomeViewControllerFactory.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import Domain
import Networking
import UIKit

struct HomeViewControllerFactory: HomeViewControllerFactoryProtocol {
    
    func makeHomeViewController(coordinator: HomeCoordinatorProtocol) -> UIViewController {
        let service = ServiceManager()
        let getRepositoriesUseCase = GetRepositoriesUseCase(service: service)
        let factory = HomeViewFactory()
        let viewModel = HomeViewModel(getRepositoriesUseCase: getRepositoriesUseCase, factory: factory)
        let viewController = HomeViewController(viewModel: viewModel, coordinator: coordinator)
        
        viewModel.viewController = viewController
                        
        return viewController
    }
}
