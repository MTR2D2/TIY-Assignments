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
        var answer = 0.0
        let op1asDouble = NSString(string: operandOne).doubleValue
        let op2asDouble = NSString(string: operandTwo).doubleValue
        
        if symbol == "+"
        {
            answer = op1asDouble + op2asDouble
        }
        
        if symbol == "-"
        {
            answer = op1asDouble - op2asDouble
        }
        if symbol == "x"
        {
            answer = op1asDouble * op2asDouble
        }
        if symbol == "÷"
        {
            answer = op1asDouble / op2asDouble
        }
        if symbol == "%"
        {
            answer = op1asDouble/100
        }
//        if symbol == "+/-"
//        {
//            answer = op1asDouble * (-1)
//        }

        
        return String(answer)
    }
    
}
