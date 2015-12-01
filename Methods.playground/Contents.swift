/*:
# Methods and Self
*/

import UIKit

// These are properties that can be used throughout the entire playground
var str = "Hello, playground"
var aVariableWithIntegerValueOf0: Int = 0


class ThisIsAMethod
// “Methods are functions that are associated with a particular type”
{
    // This is an instance property
    var aVariableWithIntegerValueOf0: Int = 0

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


/*:
You call the method as follows:
*/
let x = ThisIsAMethod()
x.anInstanceMethodOfTheClassMethod()


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

/*: 
Calling the method again reveals 3 instance methods:
*/
let y = CounterExample()
y.increment()

aVariableWithIntegerValueOf0

y.incrementBy(6, numberOfTimes: 10)
/*: 
## In the instance method incrementBy, the first parameter is local by default because it can be inferred by the name of the method; therefore, the name of the parameter should not be included when called.
### The second parameter is both local and external so it should be written out in order to show others what the code is doing.
#### This allows for the code to be easily read.
*/

aVariableWithIntegerValueOf0
//
y.reset()
//
aVariableWithIntegerValueOf0


/*:
Every instance of a type has an implicit property called self, which is exactly equivalent to the instance itself.
*/


class SelfExample
{
    var instanceVariable: Double = 0
    
    func increment()
    {
        self.instanceVariable++
    }
}


// Note, cannot use self with a struct
//
//struct SelfExample
//{
//    var instanceVariable: Double = 0
//    
//    func increment()
//    {
//        self.instanceVariable++
//    }
//}


/*:
### You must use the self property to distinguish between the parameter name and the property name when they are the same.
*/

/*:
Here, self disambiguates between a method parameter called x and an instance property that is also called x:
*/


struct Point
{
    var x = 0.0
    var y = 0.0
    
    func isToTheRightOfX(x: Double) -> Bool
    {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0)
{
    print("This point is to the right of the line where x == 1.0")
}


/*:
Without the self prefix, Swift would assume that both uses of x referred to the method parameter called x.
*/



