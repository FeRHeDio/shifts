//
//  AddShiftViewController.swift
//  Shifts
//
//  Created by Fernando Putallaz on 04/02/2021.
//

import UIKit

protocol Shiftable: AnyObject {
    func addNewShift(shift: ShiftElement)
}

class AddShiftViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var employeePicker: UIPickerView!
    @IBOutlet weak var rolePicker: UIPickerView!
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveButtonTapped(_ sender: Any) {
        handleSaveButton()
    }
    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    let employees = ["Anna", "Eugene", "Keyvan", "Anton"]
    let colors = ["Red", "Blue", "Green"]
    let roles = ["Waiter", "Prep", "Front of the house", "Cook"]
    
    var selectedEmployee: String?
    var selectedRole: String?
    var selectedColor: String?
    weak var delegate: Shiftable?
    
    let newShift = ShiftElement(role: "some", name: "some", startDate: "some", endDate: "some", color: Color(rawValue: "some") ?? .blue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerViewStuff()
    }
    
    func handleSaveButton() {
        delegate?.addNewShift(shift: newShift)
        self.dismiss(animated: true, completion: nil)
    }
  
    fileprivate func pickerViewStuff() {
        employeePicker.dataSource = self
        employeePicker.delegate = self
        rolePicker.dataSource = self
        rolePicker.delegate = self
        colorPicker.dataSource = self
        colorPicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case employeePicker:
            return employees.count
        case rolePicker:
            return roles.count
        case colorPicker:
            return colors.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerTitle = UILabel()
        
        if let view = view {
            pickerTitle = view as! UILabel
        }
        
        switch pickerView {
        case employeePicker:
            pickerTitle.text = employees[row]
        case rolePicker:
            pickerTitle.text = roles[row]
        case colorPicker:
            pickerTitle.text = colors[row]
        default:
            pickerTitle.text = "notSet"
        }
        
        pickerTitle.adjustsFontSizeToFitWidth = true
        pickerTitle.textAlignment = .center
        pickerTitle.minimumScaleFactor = 0.5
        
        return pickerTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView {
        case employeePicker:
            selectedEmployee = employees[row]
        case rolePicker:
            selectedRole = roles[row]
        case colorPicker:
            selectedColor = colors[row]
        default:
            break
        }
    }
}
