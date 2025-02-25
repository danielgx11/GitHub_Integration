//
//  WebViewControllerFactoryProtocol.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import UIKit

protocol WebViewControllerFactoryProtocol {
    func makeWebViewController(url: URL) -> UIViewController
}
