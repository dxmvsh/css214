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
    @IBOutlet var portraitView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UIDevice.current.orientation.isLandscape {
            self.view = LandscapeView()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if UIDevice.current.orientation.isLandscape {
            self.view = LandscapeView()
        } else if UIDevice.current.orientation.isPortrait {
            self.view = portraitView
        }
        
    }
}

