//
//  MasterViewController.swift
//  Browser
//
//  Created by Dimash on 10/2/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.numberOfWebsites
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let website = dataManager.getWebsite(at: indexPath.row)
        cell.textLabel?.text = website.title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebsite",
            let navigationController = segue.destination as? UINavigationController,
            let destinationVC = navigationController.visibleViewController as? DetailViewController,
            let row = self.tableView.indexPathForSelectedRow?.row {
                destinationVC.website = dataManager.getWebsite(at: row)
        }
    }

}
