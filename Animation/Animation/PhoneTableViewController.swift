//
//  PhoneTableViewController.swift
//  Animation
//
//  Created by Dimash on 11/18/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class PhoneTableViewController: UITableViewController {
    
    let phones = [
        Phone(name: "Iphone XS", price: "$799", processor: "A13", camera: "12px"),
        Phone(name: "Xiaomi Mi3", price: "$370", processor: "Snapdragon 710", camera: "48px"),
        Phone(name: "Samsung Galaxy S10", price: "$799", processor: "Snapdragon 855", camera: "48px"),
        Phone(name: "Huawei P30", price: "$699", processor: "Kirin 710", camera: "48px"),
        Phone(name: "Google Pixel 4", price: "$899", processor: "Snapdragon 855 Plus", camera: "16px"),
        Phone(name: "One Plus 7 Pro", price: "$699", processor: "Snapdragon 845", camera: "48px"),
        Phone(name: "Iphone 11 Pro", price: "$1099", processor: "A13Bionic", camera: "16px"),
        Phone(name: "Iphone 11", price: "$890", processor: "A14Bionic", camera: "12px"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "phoneCell", for: indexPath) as! PhoneTableViewCell
        let phone = phones[indexPath.row]
        cell.price?.text = phone.price
        cell.name?.text = phone.name
        cell.processor?.text = phone.processor
        cell.camera?.text = phone.camera
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let translationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
        cell.layer.transform = translationTransform
        UIView.animate(withDuration: 0.5, delay: 0.2 * Double(indexPath.row), options: .curveEaseOut, animations: {
            cell.layer.transform = CATransform3DIdentity
        })
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
