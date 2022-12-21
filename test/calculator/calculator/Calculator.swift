//
//  Calculator.swift
//  calculator
//
//  Created by Alexander Suprun on 31.08.2022.
//

import Foundation

func calculate(_ expression: String) throws  -> Double {
        let parsedString = parse(expression)
        let convertedString = convert(expression: parsedString)
        let result = try evaluate(convertedString)
        return result
    }
