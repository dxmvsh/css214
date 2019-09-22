//
//  EditViewController.swift
//  ContactBook
//
//  Created by Dimash on 9/21/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    var selectedContactIndex: Int?
    var dataManager: DataManager?
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var genderPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupNavigationBar()
    }
    
    private func setupTextFields() {
        nameTextField.text = dataManager?.contacts[selectedContactIndex!].name
        phoneNumberTextField.text = dataManager?.contacts[selectedContactIndex!].phoneNumber
        phoneNumberTextField.keyboardType = .numberPad
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Edit Contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(saveContactAndNavigateBack))
    }
    
    @objc private func saveContactAndNavigateBack() {
        guard let name = nameTextField.text, let phoneNumber = phoneNumberTextField.text else { return }
        let gender = getGender()
        let editedContact = Contact.init(name, phoneNumber, gender)
        dataManager?.setContact(at: selectedContactIndex!, to: editedContact)
        if (parent?.isKind(of: DetailViewController.self))! {
            let detailVC = parent as! DetailViewController
            detailVC.setupView()
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    private func getGender() -> String {
        let row = genderPickerView.selectedRow(inComponent: 0)
        return row == 0 ? "male" : "female"
    }
    
}

extension EditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
