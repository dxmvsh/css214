//
//  ViewController.swift
//  Calculator
//
//  Created by Dimash on 9/9/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //FIX: If app is opened in landscape portraitView is showed
    @IBOutlet weak var additionalButtons: UIStackView!
    
    @IBOutlet weak var display: UILabel!
    
    var isLandscapeOrientation: Bool = UIDevice.current.orientation.isLandscape {
        willSet {
            additionalButtons.isHidden = !newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isLandscapeOrientation = UIDevice.current.orientation.isLandscape
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        isLandscapeOrientation = UIDevice.current.orientation.isLandscape
    }
    
    @IBAction func touchButton(_ sender: UIButton) {
        
    }
    
}

