//
//  TableViewController.swift
//  Alarm
//
//  Created by Dimash on 10/14/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

enum ViewControllerType {
    case addVC
    case editVC(Int)
}
class TableViewController: UITableViewController {
    
    var alarms: [Alarm] = [
        Alarm(title: "CSS 214", time: Time(hour: 0, minute: 56))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlarm))
        navigationItem.title = "Alarms"
    }
    
    @objc private func addAlarm() {
        navigate(to: .addVC)
    }
    
    private func navigate(to vctype: ViewControllerType) {
        switch vctype {
        case .addVC:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        case .editVC(let index):
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
            vc.delegate = self
            vc.index = index
            vc.alarm = alarms[index]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmTableViewCell
        let alarm = alarms[indexPath.row]
        print("cell: \(cell), alarm: \(alarm)")
        cell.title.text = alarm.title
        cell.time.text = String(describing: alarm.time)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigate(to: .editVC(indexPath.row))
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexPath) in
            self.deleteAlarm(at: indexPath.row)
        }
        deleteAction.backgroundColor = .red
        
        return [deleteAction]
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewController: AddViewControllerDelegate {
    
    func add(alarm: Alarm) {
        alarms.append(alarm)
        tableView.reloadData()
    }
    
}

extension TableViewController: EditViewControllerDelegate {
    
    func changeAlarm(at index: Int, to alarm: Alarm) {
        alarms[index] = alarm
        tableView.reloadData()
    }
    
    func deleteAlarm(at index: Int) {
        alarms.remove(at: index)
        tableView.reloadData()
    }
    
}
