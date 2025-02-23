//
//  MessageError.swift
//
//
//  Created by Daniel Gomes Xavier on 23/02/25.
//

import Foundation

public enum MessageError: Error {
    case `default`
    
    public var localizedDescription: String {
        switch self {
        case .default:
            return "Throws the default error message"
        }
    }
}
