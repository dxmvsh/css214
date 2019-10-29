//
//  ClubTableViewCell.swift
//  SDU
//
//  Created by Dimash on 10/25/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class ClubTableViewCell: UITableViewCell {

    @IBOutlet var logo: UIImageView!
    @IBOutlet var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
