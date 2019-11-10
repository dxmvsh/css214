//
//  ViewController.swift
//  Autolayout
//
//  Created by Dimash on 11/10/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let viewControllerIdentifiers = [
        "Cards": "CardsViewController",
        "Note": "NoteViewController",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        let vc = storyboard?.instantiateViewController(withIdentifier: viewControllerIdentifiers[buttonTitle]!) as! UIViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

