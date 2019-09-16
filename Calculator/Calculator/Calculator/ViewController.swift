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
    
    @IBOutlet var clearButton: RoundedButton!
    
    var calculator = Calculator()
    
    var userIsTyping: Bool {
        set {
            if newValue {
                clearButton.setTitle("C", for: .normal)
            } else {
                clearButton.setTitle("AC", for: .normal)
            }
        }
        get {
            return clearButton.currentTitle! == "C"
        }
    }
    
    var displayValue: Double {
        get {
            if let value = display.text,
               let _ = Double(value) {
                return Double(value)!
            }
            return 0.0
        }
        set {
            display.text = String(Int(newValue))
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
    
    @IBAction func clearAll(_ sender: UIButton) {
        userIsTyping = false
        displayValue = 0.0
        calculator.clear()
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsTyping {
            calculator.set(operand: Double(display.text!)!)
            userIsTyping = false
        }
        if let mathOperator = sender.currentTitle {
            calculator.performOperation(mathOperator)
        }
        display.text = String(calculator.result)
    }
}
