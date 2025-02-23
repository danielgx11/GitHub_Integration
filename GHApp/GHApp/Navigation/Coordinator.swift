//
//  Coordinator.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 19/02/25.
//

import UIKit

public protocol CoordinatorDelegate: AnyObject { }

public protocol Coordinator: CoordinatorDelegate {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}

public extension Coordinator {
    func start() { }
}
