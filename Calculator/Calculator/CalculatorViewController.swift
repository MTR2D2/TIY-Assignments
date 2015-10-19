//
//  ViewController.swift
//  Calculator
//
//  Created by Michael Reynolds on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController
{
    var brain = CalculatorBrain()

    @IBOutlet weak var Display: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Action Handlers
    
    @IBAction func Operators(sender: UIButton)
    {
        brain.assignSymbol(sender.currentTitle!)
    }
    
    @IBAction func Clear(sender: UIButton)
    {
        Display.text = "0"
        brain = CalculatorBrain()
    }

    @IBAction func Input(sender: UIButton)
    {
        Display.text = brain.assignOperand(sender.currentTitle!)
        
// When the sender UIButton selects an input number currentTitle, the result of calling the assignOperand function from the BrainCalculator class updates the display.text
    }

    @IBAction func Calculate(sender: UIButton)
    {
        Display.text = brain.calculateAnswer(sender.currentTitle!)
    }
}

