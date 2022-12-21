//
//  Stack.swift
//  calculator
//
//  Created by Alexander Suprun on 31.08.2022.
//

import Foundation
struct Stack<Element> {
    var array : [Element] = []
    mutating func push(_ element: Element) {
        array.append(element)
    }
    @discardableResult mutating func pop() -> Element? {
        return array.popLast()
    }
    func peek() -> Element? {
        array.last
    }
}

    
