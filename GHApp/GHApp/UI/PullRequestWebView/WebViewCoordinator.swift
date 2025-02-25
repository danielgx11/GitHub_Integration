//
//  WebViewCoordinator.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import UIKit

final class WebViewCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
        
    var navigationController: UINavigationController
    var factory: WebViewControllerFactoryProtocol
    var webViewToPresentUrl: URL
    
    // MARK: - INITIALIZERS
    
    init(
        navigationController: UINavigationController,
        factory: WebViewControllerFactoryProtocol,
        url: URL
    ) {
        self.navigationController = navigationController
        self.factory = factory
        self.webViewToPresentUrl = url
    }
    
    // MARK: - METHODS
    
    func start() {
        let viewController = factory.makeWebViewController(url: webViewToPresentUrl)
        navigationController.present(viewController, animated: true)
    }
}
