//
//  ViewController.swift
//  OutaTime
//
//  Created by Michael Reynolds on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol DatePickerDelegate
{
    func timerWasChosen(timerCount: Int)
}

@IBOutlet var picker: UIPickerView!
var delegate: DatePickerDelegate?

class OutaTimeViewController: UIViewController, DatePickerDelegate
{
 
    
    @IBOutlet weak var destinationTime: UILabel!
    
    
    @IBOutlet weak var presentTime: UILabel!
    
    
    @IBOutlet weak var lastTimeDeparted: UILabel!
    
    
    @IBOutlet weak var speed: UILabel!
    
    let formatter = NSDateFormatter()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        formatter.dateFormat = NSDateFormatter.dateFormatFromTemplate(<#T##tmplate: String##String#>, options: <#T##Int#>, locale: <#T##NSLocale?#>)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowDatePickerSegue"
        {
            let datePickerVC = segue.destinationViewController
                as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TimerPicker Delegate
    
    func timerWasChosen(timerCount: Int)
    {
        destinationTime.text = "\(timerCount)"
    }

}

