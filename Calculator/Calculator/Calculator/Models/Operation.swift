//
//  Operation.swift
//  Calculator
//
//  Created by Dimash on 9/14/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

enum Operation {
    case equals
    case constant(Double)
    case unary((Double) -> Double)
    case binary((Double, Double) -> Double)
    case operationWithoutParameters(() -> Double)
}

enum MemoryOperation {
    case add(Double)
    case substract(Double)
    case result
    case clear
}
