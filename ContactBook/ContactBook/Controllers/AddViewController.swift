//
//  AddViewController.swift
//  ContactBook
//
//  Created by Dimash on 9/23/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var genderPickerView: UIPickerView!
    
    var dataManager: DataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
    
    private func setupView() {
        phoneNumberTextField.keyboardType = .numberPad
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Add Contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(addContactAndNavigateBack))
    }
    
    @objc private func addContactAndNavigateBack() {
        guard let name = nameTextField.text, let phoneNumber = phoneNumberTextField.text else { return }
        let gender = getGender()
        let newContact = Contact.init(name, phoneNumber, gender)
        dataManager?.add(newContact)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    private func getGender() -> String {
        let row = genderPickerView.selectedRow(inComponent: 0)
        return row == 0 ? "male" : "female"
    }
}

extension AddViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return "male"
        } else if row == 1 {
            return "female"
        }
        return nil
    }
    
}
