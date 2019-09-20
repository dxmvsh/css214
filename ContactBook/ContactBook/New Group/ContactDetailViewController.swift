//
//  ContactDetailViewController.swift
//  ContactBook
//
//  Created by Dimash on 9/20/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var name: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = contact?.name
        self.imageView.image = UIImage.init(named: contact?.gender ?? "")
    }
    
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell")
        
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "Phone number"
            cell?.detailTextLabel?.text = contact?.phoneNumber ?? ""
        case 1:
            cell?.textLabel?.text = "Gender"
            cell?.detailTextLabel?.text = contact?.gender.capitalized ?? ""
        default:
            break
        }
        
        return cell!
    }
    
}
