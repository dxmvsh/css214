//
//  AddViewController.swift
//  Alarm
//
//  Created by Dimash on 10/14/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit
protocol AddViewControllerDelegate {
    func add(alarm: Alarm)
}
class AddViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    var delegate: AddViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New Alarm"
    }

    @IBAction func save(_ sender: Any) {
        guard let title = titleTextField.text else { return }
        let date = datePicker.date
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let alarm = Alarm(title: title, time: Time(hour: hour, minute: minute))
        delegate?.add(alarm: alarm)
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
