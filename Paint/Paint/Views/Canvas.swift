//
//  Canvas.swift
//  Paint
//
//  Created by Dimash on 9/29/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit

class Canvas: UIView {

    var startingPoint: CGPoint?
    var endingPoint: CGPoint!
    
    override func draw(_ rect: CGRect) {
        if startingPoint != nil {
            print("starting point from draw: \(startingPoint!)")
            let line = Line(startingPoint: startingPoint!,
                            endingPoint: endingPoint,
                            color: .blue)
            line.draw()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            startingPoint = touch.location(in: self)
            print("starting point: \(startingPoint!)")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            endingPoint = touch.location(in: self)
            print("ending point: \(endingPoint!)")
        }
        setNeedsDisplay()
    }
    
}
