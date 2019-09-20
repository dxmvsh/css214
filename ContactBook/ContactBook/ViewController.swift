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
    
    private var contacts: [Contact] = [
        Contact.init("Dimash", "+7 778 497 66 89", "male"),
        Contact.init("Alina", "+7 707 131 43 33", "female")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.contact = contacts[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as? ContactCell
        let contact = contacts[indexPath.row]
        set(contact: contact, to: &cell)
        return cell!
    }
    
    private func set(contact data: Contact, to cell: inout ContactCell?) {
        cell?.name.text = data.name
        cell?.phoneNumber.text = data.phoneNumber
        cell?.contactImage.image = UIImage.init(named: data.gender)!
    }
    
}
