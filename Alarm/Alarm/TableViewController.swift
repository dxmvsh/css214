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
    
    var alarms = [Alarm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
    }
    
    private func configureNavigationItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlarm))
        navigationItem.title = "Alarms"
    }
    
    @objc private func addAlarm() {
        navigate(to: .addVC)
    }
    
    private func navigate(to vctype: ViewControllerType) {
        switch vctype {
        case .addVC:
            let vc = configureAddVC()
            navigationController?.pushViewController(vc, animated: true)
        case .editVC(let index):
            let vc = configureEditVC(index)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func configureAddVC() -> AddViewController {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        vc.delegate = self
        return vc
    }
    
    private func configureEditVC(_ index: Int) -> EditViewController {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        vc.delegate = self
        vc.index = index
        vc.alarm = alarms[index]
        return vc
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmTableViewCell
        let alarm = alarms[indexPath.row]
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
