//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Michael Reynolds on 10/16/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    var symbol: String = ""
    var operandOne: String = ""
    var operandTwo: String = ""
    
    func assignOperand(digit: String) -> String
    {
        if symbol == ""
        {
            operandOne += digit
            return operandOne
        }
        else
        {
            operandTwo += digit
            return operandTwo
        }
    }
    
    func assignSymbol(operation: String)
    {
        if operandOne != ""
        {
            symbol = operation
        }
        
    }
    
    func calculateAnswer(equals: String) -> String
    {
        
        return operandOne +  operandTwo
    }
    
}
