//
//  Calculator.swift
//  Calculator
//
//  Created by Dimash on 9/16/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

func factorial(of value: Double) -> Double {
    var result = 1.0
    for number in 2...Int(value) {
        result = result * Double(number)
    }
    return result
}

struct Calculator {
    
    private var operand: Double = 0
    private var pending: PendingBinaryOperation?
    var result: Double {
        get{
            return operand
        }
    }
    let operations: [String: Operation] = [
        "=": Operation.equals,
        "⁺∕₋": Operation.unary{-$0},
        "×": Operation.binary(*),
        "÷": Operation.binary(/),
        "+": Operation.binary(+),
        "-": Operation.binary(-),
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "¹⁄ⅹ": Operation.unary{ 1/$0 },
        "√ⅹ": Operation.unary(sqrt),
        "∛ⅹ": Operation.unary{ pow($0, (1/3)) },
        "ʸ√ⅹ": Operation.binary{ pow($0, (1/$1)) },
        "%": Operation.unary{ $0/100 },
        "sin": Operation.unary(sin),
        "sinh": Operation.unary(sinh),
        "cos": Operation.unary(cos),
        "cosh": Operation.unary(cosh),
        "tan": Operation.unary(tan),
        "tanh": Operation.unary(tanh),
        "log₁₀": Operation.unary(log10),
        "ln": Operation.unary{ log($0)/log(M_E) },
        "10ˣ": Operation.unary{ pow(10, $0) },
        "eˣ": Operation.unary{ pow(M_E, $0) },
        "x²": Operation.unary{ pow($0, 2) },
        "x³": Operation.unary{ pow($0, 3) },
        "xʸ": Operation.binary{ pow($0, $1) },
        "x!": Operation.unary(factorial),
        "EE": Operation.binary{ $0 * pow(10, $1) },
        "Rand": Operation.random{ Double(drand48()) }
    ]
    
    mutating func set(operand: Double) {
        self.operand = operand
    }
    
    mutating func performOperation(_ symbol: String) {
        guard let operation = operations[symbol] else { return }
        switch operation {
        case .binary(let function):
            executeOperation()
            pending = PendingBinaryOperation(firstOperand: operand, operation: function)
        case .unary(let function):
            operand = function(operand)
        case .random(let function):
            operand = function()
        case .constant(let constant):
            operand = constant
        case .equals:
            executeOperation()
        }
    }
    
    private mutating func executeOperation() {
        if pending != nil {
            operand = pending!.operation(pending!.firstOperand, operand)
        }
        pending = nil
    }
    
}

struct PendingBinaryOperation {
    var firstOperand: Double
    var operation: (Double, Double) -> Double
}
