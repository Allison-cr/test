//
//  Evaluator.swift
//  calculator
//
//  Created by Alexander Suprun on 31.08.2022.
//

import Foundation

func evaluate  (_ expression : [MathExpressionToken]) throws -> Double
{
    var stack = Stack<Double>()
    
    for element in expression {
        switch element {
        case .number(let number):
            stack.push(number)
            print(stack)
        case .binaryOperation:
            guard
                let number2 = stack.pop(),
                let number1 = stack.pop()
                    
            else {  continue  }
            
            switch element {
            case .binaryOperation(.addition):
                stack.push(number1 + number2)
            case .binaryOperation(.subtruction):
                stack.push(number1 - number2)
            case .binaryOperation(.multiplication):
                stack.push(number1 * number2)
            case .binaryOperation(.division):
                stack.push(number1 / number2)
            case .binaryOperation(.power):
                stack.push(pow(number1, number2))
            default:  print("aa")
            }
            
        case .prefixOperation:
            guard
                let number = stack.pop()
            else {continue}
            switch element {
            case .prefixOperation(.sin):
                stack.push(sin(number))
            case .prefixOperation(.cos):
                stack.push(cos(number))
                
            default: print("aa")
            }
        case .postfixOperation:
            guard
                let number = stack.pop()
            else {continue}
            switch element{
            case .postfixOperation(.precent):
                stack.push(number/100)
            default: print("aa")
            }
        default: print("aa")
            
        }
        
    }
    if let result = stack.pop() {
        return round( result * 100000 ) / 100000
    }
    else { return -1 }
    
}
