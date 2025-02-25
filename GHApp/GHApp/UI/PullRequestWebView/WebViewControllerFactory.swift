//
//  WebViewControllerFactory.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import UIKit

struct WebViewControllerFactory: WebViewControllerFactoryProtocol {
    
    func makeWebViewController(url: URL) -> UIViewController {
        let viewController = WebViewController(webViewUrl: url)
        
        return viewController
    }
}
