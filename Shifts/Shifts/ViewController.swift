//
//  ViewController.swift
//  Shifts
//
//  Created by Fernando Putallaz on 04/02/2021.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet weak var addShiftButton: UIBarButtonItem!
    
    var shifts = [ShiftElement]()
    var newShift: ShiftElement?
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getShifts()
        addShiftButtonStyle()
    }
    
    fileprivate func addShiftButtonStyle() {
        addShiftButton.title = "New Shift"
        addShiftButton.tintColor = .black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddShiftViewController" {
            let addShiftVC: AddShiftViewController = segue.destination as! AddShiftViewController
            addShiftVC.delegate = self
        }
    }
    
    fileprivate func getShifts() {
        shifts = API.shared.getShifts().shifts
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shifts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ShiftTableViewCell
        
        cell.shift = shifts[indexPath.item]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: Shiftable {
    func addNewShift(shift: ShiftElement) {
        shifts.append(shift)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


