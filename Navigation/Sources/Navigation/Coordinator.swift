//
//  Coordinator.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import UIKit

protocol CoordinatorDelegate: AnyObject { }

protocol Coordinator: CoordinatorDelegate {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}

extension Coordinator {
    func start() { }
}
