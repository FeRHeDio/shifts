//
//  ShiftTableViewCell.swift
//  Shifts
//
//  Created by Fernando Putallaz on 04/02/2021.
//

import UIKit

class ShiftTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var hoursRangeLabel: UILabel!
    
    var shift: ShiftElement! {
        didSet {
            setShift()
        }
    }
    
    fileprivate func setShift() {
        nameLabel.text = shift.name
        roleLabel.text = "(\(shift.role))"
        colorView.backgroundColor = UIColor(named: "\(shift.color.rawValue)") //Does not change the color -> why?
    }
}
