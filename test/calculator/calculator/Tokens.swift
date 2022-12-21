//
//  Tokens.swift
//  calculator
//
//  Created by Alexander Suprun on 31.08.2022.
//

import Foundation

enum MathExpressionToken : Equatable{
    case number(Double)
    case binaryOperation(BinaryOperation)
    case postfixOperation(PostfixOperation)
    case prefixOperation(PrefixOperation)
    case bracket(Brackets)
}

enum BinaryOperation : String, CaseIterable, Equatable{
    
    case addition = "+"
    case subtruction = "-"
    case division = "/"
    case multiplication = "*"
    case power = "^"
    
    var priority: Int {
        
        switch self {
        case .addition, .subtruction:
            return 1
        case .division, .multiplication:
            return 2
        case .power:
            return 3
        }
        
    }
}


enum PrefixOperation : String {
    
    case sin = "sin"
    case cos = "cos"
    
}

enum PostfixOperation : String {
    
    case precent = "%"
}

enum Brackets : String {
    
    case open_bracket = "("
    case close_bracket = ")"
}

