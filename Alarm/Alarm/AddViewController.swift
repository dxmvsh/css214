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
        let alarm = Alarm(title: title, time: Time.getTime(from: date))
        delegate?.add(alarm: alarm)
        navigationController?.popViewController(animated: true)
    }
    
}
