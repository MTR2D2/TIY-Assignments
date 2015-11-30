//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var aVariableWithIntegerValueOf0: Int = 0

class ThisIsAMethod
// “Methods are functions that are associated with a particular type”
{
    func anInstanceMethodOfTheClassMethod()
    // “Instance methods are functions that belong to instances of a particular class, structure, or enumeration”
    {
        if aVariableWithIntegerValueOf0 == 0
        {
            print("That'll do pig, that'll do.")
        }
        else
        {
            print("Try again Mr. Pig")
        }
    }
}

// You call the method as follows:
//let x = ThisIsAMethod()
//x.anInstanceMethodOfTheClassMethod()

struct CounterExample
{
    func increment()
    {
        ++aVariableWithIntegerValueOf0
    }
    
    func incrementBy(amount: Int, numberOfTimes: Int)
    {
        // this instance method has two parameters, amount & numberOfTimes
        aVariableWithIntegerValueOf0 += amount * numberOfTimes
    }
    
    func reset()
    {
        aVariableWithIntegerValueOf0 = 0
    }
}

// Calling the method again reveals 3 instance methods:
let y = CounterExample()
y.increment()
y.incrementBy(6, numberOfTimes: 10)
// In the instance method incrementBy, the first parameter is local by default because it can be inferred by the name of the method; therefore, the name of the parameter should not be there. The second parameter is both local and external so it should be written out so others know what the code is doing




