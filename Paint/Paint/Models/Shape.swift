//
//  Shape.swift
//  Paint
//
//  Created by Dimash on 9/29/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation
import UIKit

protocol Shape {
    var startingPoint: CGPoint { get set }
    var endingPoint: CGPoint { get set }
    var color: UIColor { get set }
    var isFilled: Bool { get set }
    var strokeWidth: CGFloat { get }
    
    func draw()
}

extension Shape {
    var strokeWidth: CGFloat { return 4.0 }
}

enum ShapeType {
    case circle
    case rectangle
    case triangle
    case line
    case pen
}
