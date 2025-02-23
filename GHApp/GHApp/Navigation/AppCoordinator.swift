//
//  AppCoordinator.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import UIKit

public class AppCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
    
    weak var coordinatorDelegate: CoordinatorDelegate?
    
    public var navigationController: UINavigationController
    let factory: AppCoordinatorFactoryProtocol
    let window: UIWindow?
    
    deinit { print("AppCoordinator deallocated") }
        
    // MARK: - INITIALIZERS
    
    init(factory: AppCoordinatorFactoryProtocol, navigationController: UINavigationController, window: UIWindow?) {
        self.factory = factory
        self.navigationController = navigationController
        self.window = window
    }
    
    // MARK: - METHODS
    
    public func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        showHome()
    }
    
    private func showHome() {
        let homeCoordinator = factory.makeHomeCoordinator(navigationController: navigationController)
        DispatchQueue.main.async {
            homeCoordinator.delegate = self
            homeCoordinator.start()
        }
    }
}

// MARK: - HomeCoordinatorDelegate

extension AppCoordinator: HomeCoordinatorDelegate { }
