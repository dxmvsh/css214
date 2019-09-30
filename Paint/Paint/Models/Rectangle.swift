//
//  Rectangle.swift
//  Paint
//
//  Created by Dimash on 9/29/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation
import UIKit

class Rectangle: Shape {
    var startingPoint: CGPoint
    var endingPoint: CGPoint
    var color: UIColor
    var isFilled: Bool
    
    lazy var width: CGFloat = {
        return abs(endingPoint.x - startingPoint.x)
    }()
    
    lazy var height: CGFloat = {
        return abs(endingPoint.y - startingPoint.y)
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
        let rectangle = CGRect(origin: startingPoint,
                               size: CGSize(width: width, height: height))
        let path = UIBezierPath(rect: rectangle)
        path.lineWidth = strokeWidth
        color.set()
        isFilled ? path.fill() : path.stroke()
    }
    
}
