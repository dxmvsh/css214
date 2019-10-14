//
//  AlarmTableViewCell.swift
//  Alarm
//
//  Created by Dimash on 10/14/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet var time: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var alarmSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
