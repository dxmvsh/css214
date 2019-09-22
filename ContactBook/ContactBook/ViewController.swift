//
//  ViewController.swift
//  ContactBook
//
//  Created by Dimash on 9/20/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(navigateToAddVC))
    }
    
    @objc private func navigateToAddVC() {
        let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        addVC.dataManager = dataManager
        navigationController?.pushViewController(addVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.selectedContactIndex = indexPath.row
        detailVC.dataManager = dataManager
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as? ContactCell
        let contact = dataManager.contacts[indexPath.row]
        set(contact: contact, to: &cell)
        return cell!
    }
    
    private func set(contact data: Contact, to cell: inout ContactCell?) {
        cell?.name.text = data.name
        cell?.phoneNumber.text = data.phoneNumber
        cell?.contactImage.image = UIImage.init(named: data.gender)!
    }
    
}
