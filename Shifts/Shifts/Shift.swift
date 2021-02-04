//
//  Shift.swift
//  Shifts
//
//  Created by Fernando Putallaz on 04/02/2021.
//

import Foundation

struct Shift: Codable {
    let shifts: [ShiftElement]
}

struct ShiftElement: Codable {
    let role, name, startDate, endDate: String
    let color: Color

    enum CodingKeys: String, CodingKey {
        case role, name
        case startDate = "start_date"
        case endDate = "end_date"
        case color
    }
}

enum Color: String, Codable {
    case blue = "blue"
    case green = "green"
    case red = "red"
}

