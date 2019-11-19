//
//  PhoneTableViewCell.swift
//  Animation
//
//  Created by Dimash on 11/18/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class PhoneTableViewCell: UITableViewCell {

    @IBOutlet weak var initialView: UIView!
    @IBOutlet weak var detailedView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var processor: UILabel!
    @IBOutlet weak var camera: UILabel!
    
    @IBAction func backTapped(_ sender: UIButton) {
        UIView.transition(from: detailedView!,
                          to: initialView!,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          completion: nil)
    }
    
    @IBAction func infoTapped(_ sender: UIButton) {
        UIView.transition(from: initialView!,
                          to: detailedView!,
                          duration: 0.3,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

