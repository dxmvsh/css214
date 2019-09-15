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
    
    var userIsTyping = false
    
    var displayValue: Double {
        get {
            if let value = display.text,
               let _ = Double(value) {
                return Double(value)!
            }
            return 0.0
        }
        set {
            if let displayText = display.text {
                display.text = displayText + String(newValue)
            }
        }
    }
    
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
    
    @IBAction func touchDigit(_ sender: UIButton) {
        if let title = sender.currentTitle {
            if userIsTyping {
                display.text = display.text! + title
            } else {
                display.text = title
                userIsTyping = true
            }
        }
    }
    
    @IBAction func touchFloatingPoint(_ sender: UIButton) {
        if !display.text!.contains(sender.currentTitle!) {
            display.text = display.text! + sender.currentTitle!
        }
        userIsTyping = true
    }
    
}
