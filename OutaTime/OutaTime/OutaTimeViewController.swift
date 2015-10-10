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
    func dateWasChosen(date: NSDate)
}

class OutaTimeViewController: UIViewController, DatePickerDelegate
{
 
    
    @IBOutlet weak var destinationTime: UILabel!
    
    
    @IBOutlet var presentTime: UILabel!
    
    
    @IBOutlet weak var lastTimeDeparted: UILabel!
    
    
    @IBOutlet weak var speed: UILabel!
    
    var speedVariable: Int!
    
    var lastTimeDepartedVariable: Int!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       presentTime.text = dateFormat(NSDate())
        
        speedVariable = 0
        
        
        setLabelSpeed()
        
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
    
    func dateWasChosen(date: NSDate)
    {

        destinationTime.text = dateFormat(date)
       
    }
    
    func dateFormat(x: NSDate) -> String
    {
        let formatter = NSDateFormatter()
        formatter.dateFormat = NSDateFormatter.dateFormatFromTemplate("MMM dd yyyy", options: 0, locale: NSLocale.currentLocale())
        let formattedTime = formatter.stringFromDate(x).uppercaseString
        
        return String(formattedTime)
    }
    
    func setLabelSpeed()
    {
        speed.text = "\(speedVariable)MPH"
    }
    
    // MARK: Action Handlers
    
    @IBOutlet weak var travelBackButtonPressed: UIButton!
    
    func buttonTapped() -> Bool
    {
        
    }
    
    private func startTimer()
    {
        if speedVariable == nil
        {
            speedVariable = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: (buttonTapped(), userInfo: nil, repeats: true)
        }
   
}

