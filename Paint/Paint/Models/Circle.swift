//
//  Circle.swift
//  Paint
//
//  Created by Dimash on 9/29/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation
import UIKit

class Circle: Shape {
    var startingPoint: CGPoint
    var endingPoint: CGPoint
    var isFilled: Bool
    var color: UIColor
    
    lazy var arcCenter: CGPoint = {
        return CGPoint(x: startingPoint.x + radius, y: startingPoint.y + radius)
    }()
    
    lazy var radius: CGFloat = {
        return abs(abs(endingPoint.x - startingPoint.x)/2)
    }()
    
    init(startingPoint: CGPoint,
         endingPoint: CGPoint,
         color: UIColor,
         isFilled: Bool) {
        self.startingPoint = startingPoint
        self.endingPoint = endingPoint
        self.color = color
        self.isFilled = isFilled
    }
    
    func draw() {
        let path = UIBezierPath(arcCenter: CGPoint(x: startingPoint.x + radius,
                                                   y: startingPoint.y + radius),
                                radius: radius,
                                startAngle: 0,
                                endAngle: CGFloat(2*Double.pi),
                                clockwise: true)
        path.lineWidth = strokeWidth
        color.set()
        isFilled ? path.fill() : path.stroke()
        
    }
    
}
