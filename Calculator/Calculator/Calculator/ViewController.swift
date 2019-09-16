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
    
    private var isSecond: Bool = false
    
    private let secondTextVariation: [String: String] = [
        "sin": "sin⁻¹",
        "cos": "cos⁻¹",
        "tan": "tan⁻¹",
        "sinh": "sinh⁻¹",
        "cosh": "cosh⁻¹",
        "tanh": "tanh⁻¹",
        "eˣ": "yˣ",
        "ln": "logy",
        "10ˣ": "2ˣ",
        "log₁₀": "log₂"
    ]
    
    private let initialTextVariation: [String: String] = [
        "sin⁻¹": "sin",
        "cos⁻¹": "cos",
        "tan⁻¹": "tan",
        "sinh⁻¹": "sinh",
        "cosh⁻¹": "cosh",
        "tanh⁻¹": "tanh",
        "yˣ": "eˣ",
        "logy": "ln",
        "2ˣ": "10ˣ",
        "log₂": "log₁₀"
    ]
    
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
    
    @IBOutlet var flippyButtons: [UIButton]!
    
    @IBAction func changeButtons(_ sender: UIButton) {
        isSecond = !isSecond
        changeButtonParameters(for: sender)
        if isSecond {
            for button in flippyButtons {
                if let title = button.currentTitle {
                    button.setTitle(secondTextVariation[title], for: .normal)
                }
            }
        } else {
            for button in flippyButtons {
                if let title = button.currentTitle {
                    button.setTitle(initialTextVariation[title], for: .normal)
                }
            }
        }
    }
    
    func changeButtonParameters(for button: UIButton) {
        if isSecond {
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        } else {
            button.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
            button.setTitleColor(.white, for: .normal)
        }
    }
}
