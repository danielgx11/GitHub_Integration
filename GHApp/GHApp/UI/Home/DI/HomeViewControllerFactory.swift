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
    
    func makeHomeViewController(delegate: HomeCoordinator) -> UIViewController {
        let service = ServiceManager()
        let getPullsUseCase = GetPullsUseCase(service: service)
        let factory = HomeViewFactory()
        let viewModel = HomeViewModel(getPullsUseCase: getPullsUseCase, factory: factory)
        let viewController = HomeViewController(viewModel: viewModel)
        
        viewModel.viewController = viewController
        
        viewController.delegate = delegate
                
        return viewController
    }
}
