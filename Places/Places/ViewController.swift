//
//  ViewController.swift
//  Places
//
//  Created by Dimash on 10/29/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        segmentedControl.tintColor = .black
    }
    
    func setupNavigationBar() {
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurEffectView.frame = (self.navigationController?.navigationBar.bounds.insetBy(dx: 0, dy: -10).offsetBy(dx: 0, dy: -10))!
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.addSubview(blurEffectView)
    }

}

