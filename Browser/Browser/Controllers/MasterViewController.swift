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
        loadNavigationItem()
    }
    
    // MARK: - Table view data source
    private func loadNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(showWebsiteAddAlert))
    }
    
    @objc private func showWebsiteAddAlert() {
        let alert = UIAlertController(title: "Add Website",
                                      message: "Fill fields below",
                                      preferredStyle: .alert)
        alert.addTextField { (titleTextField) in
            titleTextField.placeholder = "Title"
        }
        alert.addTextField { (urlTextField) in
            urlTextField.placeholder = "URL"
        }
        
        alert.addAction(UIAlertAction(title: "Add",
                                      style: .default,
                                      handler: { (_) in
                                        guard let titleTextField = alert.textFields?[0], let urlTextField = alert.textFields?[1] else { return }
                                        if let title = titleTextField.text,
                                            let urlStr = urlTextField.text {
                                            print("title: \(title), urlStr: \(urlStr)")
                                            let website = Website(title: title, url: URL(string: urlStr)!)
                                            self.dataManager.add(website: website)
                                            print("uialertaction:")
                                            self.dataManager.printAllWebsitesInfo()
                                            self.tableView.reloadData()
                                        }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
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
