//
//  ViewController.swift
//  OutaTime
//
//  Created by Michael Reynolds on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol TimeCircuitsDatePickerDelegate
{
    func timerWasChosen(timerCount: Int)
}

class OutaTimeViewController: UIViewController
{
    @IBOutlet weak var destinationTimeLabel: UILabel!

    @IBOutlet weak var destinationTime: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var presentTime: UILabel!
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    
    @IBOutlet weak var lastTimeDeparted: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var speed: UILabel!
    
    @IBOutlet weak var setDestinationTimeButton: UIButton!
    
    @IBOutlet weak var travelBackButton: UIButton!
    
//    let NSDateFormatter: String
    
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


}

