//
//  EditViewController.swift
//  Places
//
//  Created by Dimash on 11/4/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate {
    func updatePlace(at index: Int, title: String, description: String)
    func updateAnnotations()
}

class EditViewController: UIViewController {

    @IBOutlet var titleTF: UITextField!
    @IBOutlet var descriptionTF: UITextField!
    
    var editingPlaceIndex: Int = 0
    var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTextFields()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(done))
    }
    
    private func setupTextFields() {
        let place = DataManager.places[editingPlaceIndex]
        titleTF.text = place.title
        descriptionTF.text = place.description
    }
    
    @objc private func done() {
        guard let title = titleTF.text, let description = descriptionTF.text else { return }
        delegate?.updatePlace(at: editingPlaceIndex, title: title, description: description)
        delegate?.updateAnnotations()
        navigationController?.popViewController(animated: true)
    }
}
