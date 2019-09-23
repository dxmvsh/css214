//
//  ContactCell.swift
//  ContactBook
//
//  Created by Dimash on 9/20/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit
import Foundation

class ContactCell: UITableViewCell {

    @IBOutlet var contactImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
