//
//  RoundedButton.swift
//  Calculator
//
//  Created by Dimash on 9/11/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
    
}
