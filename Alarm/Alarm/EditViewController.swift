//
//  EditViewController.swift
//  Alarm
//
//  Created by Dimash on 10/14/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate {
    func changeAlarm(at index: Int, to alarm: Alarm)
    func deleteAlarm(at index: Int)
}

class EditViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var alarmDate: UIDatePicker!
    var alarm: Alarm?
    var index: Int?
    var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.date(from: String(describing: alarm!.time))
        
        alarmDate.date = date!
        titleTextField.text = alarm?.title
        navigationItem.title = "Change Alarm"
    }
    
    @IBAction func changeAlarm(_ sender: Any) {
        print("AAAAABBB")
        guard let title = titleTextField.text else { return }
        guard let index = index else { return }
        let date = alarmDate.date
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let alarmModified = Alarm(title: title, time: Time(hour: hour, minute: minute))
        delegate?.changeAlarm(at: index, to: alarmModified)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteAlarm(_ sender: Any) {
        guard let index = index else { return }
        delegate?.deleteAlarm(at: index)
        navigationController?.popViewController(animated: true)
    }
}
