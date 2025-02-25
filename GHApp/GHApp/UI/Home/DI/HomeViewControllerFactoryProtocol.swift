//
//  HomeViewControllerFactoryProtocol.swift
//  GHApp
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation
import UIKit

protocol HomeViewControllerFactoryProtocol {
    func makeHomeViewController(coordinator: HomeCoordinatorProtocol) -> UIViewController
}
