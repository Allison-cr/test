//
//  Converter.swift
//  calculator
//
//  Created by Alexander Suprun on 31.08.2022.
//

import Foundation
func convert ( expression : [MathExpressionToken] ) -> [MathExpressionToken]
{
    
    var result : [MathExpressionToken] = []
    var stack = Stack<MathExpressionToken>()
    
    for element in expression{
        switch element {
        case .number, .postfixOperation :
            result.append(element)
        case .bracket(.open_bracket),.prefixOperation :
            stack.push(element)
        case .bracket(.close_bracket) :
            while let top = stack.pop(), top != .bracket(.open_bracket) {
                result.append(top)
            }
        case .binaryOperation(let currentOperation) :
            while let top = stack.peek() {
                if case let .binaryOperation(topOperation) = top ,
                   topOperation.priority >= currentOperation.priority
                {
                    result.append(top)
                    stack.pop()
                } else {
                    break
                }
                
            }
            stack.push(element)
        }
    }
    while let top = stack.pop() {
        result.append(top)
    }
    
    return result
}
