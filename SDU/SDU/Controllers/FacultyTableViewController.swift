//
//  FacultyTableViewController.swift
//  SDU
//
//  Created by Dimash on 10/25/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class FacultyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Faculties"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.faculties.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacultyTableViewCell", for: indexPath) as! FacultyTableViewCell
        cell.nameLabel.text = DataManager.faculties[indexPath.row].name
        cell.descriptionTextView.text = DataManager.faculties[indexPath.row].description
        return cell
    }
    
    
}
