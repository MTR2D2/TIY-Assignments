//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Michael Reynolds on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate

@IBOutlet var datePicker: UIDatePicker!
@IBOutlet var timePicker: UIDatePicker!
@IBOutlet var dateTimeDisplay: UILabel!

let dateFormatter = NSDateFormatter()
let timeFormatter = NSDateFormatter()

override func viewDidLoad()
{
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
}

override func viewWillDisappear(animated: Bool)
{
    super.viewWillDisappear(animated)
    
    delegate?.timerWasChosen(60-picker.selectedRowInComponent(0))
}
override func didReceiveMemoryWarning()
{
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

@IBAction func datePickerChanged(sender: AnyObject) {
}


    