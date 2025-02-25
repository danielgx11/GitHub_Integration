//
//  File.swift
//  
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation

extension String {
    public func toBrazilianDateFormat() -> String? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime]

        guard let date = isoFormatter.date(from: self) else { return nil }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd/MM/yyyy"
        outputFormatter.locale = Locale(identifier: "pt_BR")
        outputFormatter.calendar = .init(identifier: .gregorian)

        return outputFormatter.string(from: date)
    }
}
