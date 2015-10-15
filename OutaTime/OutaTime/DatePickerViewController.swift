//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Michael Reynolds on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController
{
    @IBOutlet var datePicker: UIDatePicker!
    var delegate: DatePickerDelegate?
    //question mark means optional, doesn't have to have a value

    override func viewDidLoad()
    { 
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        delegate?.dateWasChosen(datePicker.date)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
    