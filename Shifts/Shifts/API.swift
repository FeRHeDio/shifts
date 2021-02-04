//
//  API.swift
//  Shifts
//
//  Created by Fernando Putallaz on 04/02/2021.
//

import Foundation

class API {
    static let shared = API()
    
    func getShifts() -> Shift {
        var shift: Shift?
        if let path = Bundle.main.path(forResource: "shifts", ofType: "json") {
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                shift = try Foundation.JSONDecoder().decode(Shift.self, from: data)
            }catch{
                print("LN123 Parsing shifts from Json fullError? ->> \(error)")
            }
        }
        return shift!
    }
}
