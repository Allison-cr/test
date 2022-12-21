//
//  Parser.swift
//  calculator
//
//  Created by Alexander Suprun on 31.08.2022.
//

import Foundation


func parse (_ expression : String) -> [MathExpressionToken]{
    var str = expression
    var result: [MathExpressionToken] = []
    var number = ""
    
    while !str.isEmpty {
        let char = String(str.removeFirst())
        
        if Int(char) != nil || char == "." {
            number += char
        } else {
            if let number = Double(number){
                result.append(.number(number))
            }
        number = ""
            
            if let operation = BinaryOperation(rawValue: char) {
                result.append(.binaryOperation(operation))
            } else if let operation = PostfixOperation(rawValue: char) {
                result.append(.postfixOperation(operation))
            } else if let brackett = Brackets(rawValue: char) {
                result.append(.bracket(brackett))
            }
            
        }
        
    }
    if let number = Double(number) {
        result.append(.number(number))
    }
    return result
}
