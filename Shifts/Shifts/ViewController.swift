//
//  ViewController.swift
//  Shifts
//
//  Created by Fernando Putallaz on 04/02/2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var shifts = [ShiftElement]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getShifts()
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
}



