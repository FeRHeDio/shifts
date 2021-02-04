//
//  UIColor+Named.swift
//  Shifts
//
//  Created by Fernando Putallaz on 04/02/2021.
//

import UIKit

extension UIColor {
    public func named(_ name: String) -> UIColor? {
        let allColors: [String: UIColor] = [
            "red": .red,
            "blue": .blue,
            "green": .green,
        ]
        let cleanedName = name.replacingOccurrences(of: " ", with: "").lowercased()
        return allColors[cleanedName]
    }
}
