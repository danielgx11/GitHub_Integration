//
//  UITableView+Extension.swift
//
//
//  Created by Daniel Gomes Xavier on 20/02/25.
//

import Foundation
import UIKit

extension UITableView {
    
    public func register(_ cell: UITableViewCell.Type) {
        register(cell, forCellReuseIdentifier: String(describing: cell.self))
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, for indexpath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexpath) as? T ?? T()
    }
}
